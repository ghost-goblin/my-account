import express from "express";
import dotenv from "dotenv";
dotenv.config({ path: "./environments/.env.temp" });

const app = express();
const env = process.env.ENVIRONMENT;
const port = process.env.APPLICATION_PORT;
const app_name = process.env.APPLICATION_NAME;
const secret = process.env.SECRET_01

app.get("/", (req, res) => {
  res.send(`"${env}-${app_name}" is running on port ${port}! SECRET_01="${secret}"!`);
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}!`);
});
