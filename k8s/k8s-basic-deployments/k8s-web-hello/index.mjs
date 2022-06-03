import express  from "express";
import os from "os";

const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
    const hello = `Hello ${os.hostname()}`;
    console.log(hello);
    res.send(hello);
});


app.listen(PORT, () => {
    console.log(`Server is listening on port ${PORT}`);
});