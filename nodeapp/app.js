const express = require("express");
const app = express();

app.get("/", (req, res) => {
    res.send("Service is up and runing");
});

app.listen(8080, () => {
    console.log("Serveur is up");
});