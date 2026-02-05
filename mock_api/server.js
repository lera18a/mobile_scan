console.log("STARTING MOCK API FILE:", __filename);
const express = require("express");
const cors = require("cors");
const path = require("path");

const app = express();
app.use(cors());
app.use(express.json());

const productsByBarcode = {
    "4601234567893": {
        barcode: "4601234567893",
        name: "Кроссовки Nike Air",
        imagePath: "/images/4601234567893.jpg",
        sizes: [
            { size: "40", inStock: true, qty: 2 },
            { size: "41", inStock: false, qty: 0 },
            { size: "42", inStock: true, qty: 5 }
        ]
    },
    "1234567890128": {
        barcode: "1234567890128",
        name: "Футболка Basic",
        imagePath: "/images/1234567890128.jpg",
        sizes: [
            { size: "S", inStock: true, qty: 10 },
            { size: "M", inStock: false, qty: 0 },
            { size: "L", inStock: true, qty: 3 }
        ]
    }
};

function imageUrl(req, p) {
    const host = req.get('host');
    const protocol = 'http';
    return {
        ...p, imageUrl:
            `${protocol}://${host}${p.imagePath}`
    }
}

app.use('/images', express.static(path.join(__dirname, "assets/images")));

app.get("/health", (_, res) => res.json({ ok: true }));

app.get("/api/products/:barcode", (req, res) => {
    const p = productsByBarcode[req.params.barcode];
    if (!p) return res.status(404).json({ error: "NOT_FOUND" });
    return res.json(imageUrl(req, p));
});

const port = 3000;
app.listen(port, "0.0.0.0", () => {
    console.log(`Mock API running on port ${port}`);
});
