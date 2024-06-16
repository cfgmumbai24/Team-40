const pool = require("../db");

exports.getAll = async (req, res) => {
    try {
        const id = req.params.id;
        const sqlQuery = "SELECT * FROM teachers where id = ? ";
        const rows = await pool.query(sqlQuery, [id]); 
            res.status(200).json({
                status: 'success',
                data: rows
            });

    } catch (error) {
        console.error("Error in getting students:", error);
        res.status(500).json({ error: "Internal server error" });
    }
};

