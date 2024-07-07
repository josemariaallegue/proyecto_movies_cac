const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const { getUserByEmail, createUser, getUserById, updateUser } = require('../controllers/userController');
const fs = require('fs');
const path = require('path');
const db = require('../db/db');

// Función para hacer la firma digital
function generateAccessToken(user) {
    return jwt.sign(user, process.env.SECRET, { expiresIn: '1h' });
}

function validateToken(req, res, next) {
    const accessToken = req.headers['authorization'] || req.query.accessToken;
    if (!accessToken) {
        return res.status(403).json({ error: 'Acceso Denegado' });
    }

    jwt.verify(accessToken, process.env.SECRET, (error, user) => {
        if (error) {
            return res.status(403).json({ error: 'Acceso denegado, token expiró o es incorrecto' });
        } else {
            req.user = user;
            next();
        }
    });
}

function loginPage(req, res) {
    res.sendFile(path.join(__dirname, '../views/iniciosesion.html'));
}

async function registerUser(req, res) {
    try {
        const { Name, Surname, Email, Password, Birthday, Countries_CountryID } = req.body;
        const ProfilePicture = req.file ? req.file.filename : null;

        if (!Name || !Surname || !Email || !Password || !Birthday || !Countries_CountryID) {
            return res.status(400).json({ error: 'Todos los campos son requeridos' });
        }

        const existingUser = await getUserByEmail(Email);
        if (existingUser) {
            return res.status(400).json({ error: 'El usuario ya existe' });
        }

        const hashedPassword = await bcrypt.hash(Password, 10);
        const newUser = await createUser(Name, Surname, Email, hashedPassword, Birthday, ProfilePicture, Countries_CountryID);

        console.log('Usuario creado exitosamente!!');

        res.status(201).json({ message: 'Usuario creado exitosamente!!' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
}

async function authenticateUser(req, res) {
    try {
        const { Email, Password } = req.body;

        if (!Email || !Password) {
            return res.status(400).json({ error: 'Se requieren correo electrónico y contraseña' });
        }

        const user = await getUserByEmail(Email);

        if (!user) {
            return res.status(401).json({ error: 'Usuario no encontrado' });
        }

        const validPassword = await bcrypt.compare(Password, user.Password);
        if (!validPassword) {
            return res.status(401).json({ error: 'Contraseña incorrecta' });
        }

        const token = generateAccessToken({ userId: user.UserID, email: user.Email });

        console.log('Inicio de sesión exitoso!!');

        res.json({ token, redirectUrl: '../views/index.html' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
}

async function updateUserProfile(req, res) {
    try {
        const { UserID } = req.params;
        const { Name, Surname, Email, Password, Birthday, Countries_CountryID } = req.body;
        const ProfilePicture = req.file ? req.file.filename : null;

        let updateData = {};
        if (Name) updateData.Name = Name;
        if (Surname) updateData.Surname = Surname;
        if (Email) updateData.Email = Email;
        if (Password) updateData.Password = await bcrypt.hash(Password, 10);
        if (Birthday) updateData.Birthday = Birthday;
        if (Countries_CountryID) updateData.Countries_CountryID = Countries_CountryID;
        if (ProfilePicture) {
            updateData.ProfilePicture = ProfilePicture;

            const previousUser = await getUserById(UserID);
            if (previousUser.ProfilePicture) {
                const filePath = path.join(__dirname, '../uploads', previousUser.ProfilePicture);
                fs.unlinkSync(filePath); // Eliminar archivo existente
            }
        }

        const sql = 'UPDATE Users SET ? WHERE UserID = ?';
        const [result] = await db.query(sql, [updateData, UserID]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Usuario no encontrado' });
        }

        res.json({ message: 'Perfil actualizado' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
}


module.exports = {
    generateAccessToken,
    validateToken,
    loginPage,
    registerUser,
    authenticateUser,
    updateUserProfile
};