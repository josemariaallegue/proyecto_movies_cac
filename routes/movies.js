const express = require("express");
const moviesController = require("../controllers/moviesController");

const router = express.Router();

router
  .route("/")
  .get(moviesController.getMovies)
  .post(moviesController.createMovie);

router
  .route("/:MovieID")
  .get(moviesController.getMovie)
  .delete(moviesController.deleteMovie)
  .put(moviesController.updateMovie);

module.exports = router;
