import express from "express";
import dotenv from "dotenv";
dotenv.config({ path: "./environments/.env.temp" });

const app = express();
const port = process.env.APPLICATION_PORT;
const app_name = process.env.APPLICATION_NAME;
const secret = process.env.SECRET_01

app.get(`/${port}`, (req, res) => {
  res.send(`"${app_name}" is running on port ${port}! SECRET_01="${secret}"!`);
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}!`);
});