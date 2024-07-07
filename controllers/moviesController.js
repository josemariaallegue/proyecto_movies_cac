const db = require('../db/db');

const getMovies = async (req, res) => {
  try {
    const [result] = await db.query("SELECT * FROM Movies");
    res.status(200).json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: "Error getting all movies" });
  }
};

const getMovie = async (req, res) => {
  try {
    const { MovieID } = req.params;
    const [result] = await db.query("SELECT * FROM Movies WHERE MovieID = ?", [MovieID]);

    if (result.length === 0) {
      res.status(404).json({ msg: `Movie with id '${MovieID}' not found` });
    } else {
      res.status(200).json(result[0]);
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: "Error getting the movie" });
  }
};

const createMovie = async (req, res) => {
  try {
    const { Title, Director, Year, CoverImage, Countries_CountryID, Genres_GenreID } = req.body;

    const [movieInDatabase] = await db.query("SELECT * FROM Movies WHERE Title = ?", [Title]);

    if (movieInDatabase.length !== 0) {
      res.status(409).json({ msg: `Movie with title '${Title}' already in database` });
    } else {
      const [result] = await db.query(
        "INSERT INTO Movies (Title, Director, Year, CoverImage, Countries_CountryID, Genres_GenreID) VALUES (?, ?, ?, ?, ?, ?)",
        [Title, Director, Year, CoverImage, Countries_CountryID, Genres_GenreID]
      );

      if (result.affectedRows > 0) {
        res.status(201).json({ msg: `Movie with title '${Title}' successfully created` });
      }
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: "Error creating the movie" });
  }
};

const deleteMovie = async (req, res) => {
  try {
    const { MovieID } = req.params;
    const [result] = await db.query("DELETE FROM Movies WHERE MovieID = ?", [MovieID]);

    if (result.affectedRows > 0) {
      res.status(200).json({ msg: `Movie with id '${MovieID}' successfully deleted` });
    } else {
      res.status(404).json({ msg: `Movie with id '${MovieID}' not found` });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: "Error deleting the movie" });
  }
};

const updateMovie = async (req, res) => {
  try {
    const { MovieID } = req.params;
    const { Title, Director, Year, CoverImage, Countries_CountryID, Genres_GenreID } = req.body;

    const [result] = await db.query(
      "UPDATE Movies SET Title = ?, Director = ?, Year = ?, CoverImage = ?, Countries_CountryID = ?, Genres_GenreID = ? WHERE MovieID = ?",
      [Title, Director, Year, CoverImage, Countries_CountryID, Genres_GenreID, MovieID]
    );

    if (result.affectedRows > 0) {
      res.status(200).json({ msg: `Movie with id ${MovieID} successfully updated` });
    } else {
      res.status(404).json({ msg: `Movie with id '${MovieID}' not found` });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: "Error updating the movie" });
  }
};

module.exports = { getMovies, getMovie, createMovie, deleteMovie, updateMovie };
