const express = require("express");
const router = express.Router();
const multer = require("multer"); // Importa multer para manejar archivos
const userController = require("../controllers/userController");
const path = require('path');

// Configuración de Multer para subir archivos
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./uploads"); // Ruta donde se guardarán los archivos
  },
  filename: (req, file, cb) => {
    cb(null, `${Date.now()}-${file.originalname}`); // Nombre del archivo guardado
  },
});
const upload = multer({ storage });

// Rutas para operaciones CRUD de usuarios
router.get('/', userController.getAllUsers);
router.get('/:UserID', userController.getUserById);
router.post('/register', upload.single('ProfilePicture'), (req, res) => {
    const { Name, Surname, Email, Password, Birthday, Countries_CountryID } = req.body;
    const ProfilePicture = req.file ? req.file.filename : null;

    userController.createUser(Name, Surname, Email, Password, Birthday, ProfilePicture, Countries_CountryID)
        .then(newUser => {
            res.status(201).json({ message: 'Usuario creado exitosamente', user: newUser });
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Error interno del servidor' });
        });
});
router.put('/profile/:UserID', userController.updateUser);
router.delete('/:UserID', userController.deleteUser);

module.exports = router;
