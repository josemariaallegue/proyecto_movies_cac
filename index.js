const path = require("path");
const fs = require('fs');
const express = require("express");
const { logger } = require("./middleware/logEvents");
const errorHandler = require("./middleware/errorHandler");
const movieRoutes = require('./routes/movies');
const userRoutes = require('./routes/userRoutes');
const authRoutes = require('./routes/authRoutes');
const rootRoutes = require('./routes/root');
const dotenv = require('dotenv').config();


const app = express();

// Crear directorio uploads si no existe
const uploadsDir = path.join(__dirname, 'uploads');
if (!fs.existsSync(uploadsDir)) {
    fs.mkdirSync(uploadsDir);
}

// Middleware para logging y parsing
app.use(logger);
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Servir archivos estáticos
app.use("/", express.static(path.join(__dirname, "./public")));
app.use("/", express.static(path.join(__dirname, "./views"))); 

// Rutas específicas
app.use("/movies", movieRoutes);
app.use("/users", userRoutes);
app.use('/auth', authRoutes);  

// Rutas generales (root)
app.use("/", rootRoutes);

// Configurar puerto
const PORT = process.env.PORT || 3500;

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, './views/index.html'));
});
// Manejo de rutas no encontradas
app.all("*", (req, res) => {
  res.status(404);

  if (req.accepts("html")) {
    res.sendFile(path.join(__dirname, "views", "404.html"));
  } else if (req.accepts("json")) {
    res.json({ error: "404 not found" });
  } else {
    res.type("txt").send("404 not found");
  }
});

// Middleware de manejo de errores
app.use(errorHandler);

// Inicializar servidor y base de datos si es necesario
app.listen(PORT, () => {
  console.log(`El servidor está encendido en http://localhost:${PORT}/`);

  const shouldInitDB = true; // Cambia esta bandera según sea necesario
  if (shouldInitDB) {
    require('./db/initDB.js'); // Solo importa y ejecuta initDb.js si es necesario
  }
});

