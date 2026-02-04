console.log("STARTING MOCK API FILE:", __filename);
const express = require("express");
const cors = require("cors");
const path = require("path");

const app = express();
app.use(cors());
app.use(express.json());

const productsByBarcode = {
    "4601234567890": {
        barcode: "4601234567890",
        name: "Кроссовки Nike Air",
        imageUrl: "http://localhost:3000/images/4601234567890.jpg",
        sizes: [
            { size: "40", inStock: true, qty: 2 },
            { size: "41", inStock: false, qty: 0 },
            { size: "42", inStock: true, qty: 5 }
        ]
    },
    "123456789012": {
        barcode: "123456789012",
        name: "Футболка Basic",
        imageUrl: "http://localhost:3000/images/123456789012.jpg",
        sizes: [
            { size: "S", inStock: true, qty: 10 },
            { size: "M", inStock: false, qty: 0 },
            { size: "L", inStock: true, qty: 3 }
        ]
    }
};

const hostname = 'localhost';
app.use('/images', express.static(path.join(__dirname, "assets/images")));
//если не работает снеси эту хуйню
app.get("/health", (_, res) => res.json({ ok: true }));


app.get("/api/products/:barcode", (req, res) => {
    const p = productsByBarcode[req.params.barcode];
    if (!p) return res.status(404).json({ error: "NOT_FOUND" });
    return res.json(p);
});

// 0.0.0.0 важно для реального iPhone позже
const port = 3000;
app.listen(port, "0.0.0.0", () => {
    console.log(`Mock API running on http://${hostname}:${port}`);
});
