import express  from "express";
import fetch from 'node-fetch'
import os from "os";

const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
    const helloMessage = `Hello ${os.hostname()}`;
    console.log(helloMessage);
    res.send(helloMessage);
});

app.get("/nginx", async (req, res) => {
    const url = 'http://nginx:80';
    const response = await fetch(url);
    const body = await response.text();
    res.send(body);
});

app.listen(PORT, () => {
    console.log(`Server is listening on port ${PORT}`);
});