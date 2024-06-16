const pool = require("../db");

exports.login = async (req, res) => {
    try {
        const { userName, password } = req.body;

        const sqlQuery = "SELECT * FROM access_control WHERE userName=?";
        const rows = await pool.query(sqlQuery, [userName]); 

        if (rows.length === 0) {
            return res.status(404).json({
                status: 'fail',
                message: 'User not found'
            });
        }

        const user = rows[0];
        let tId = "null";
        if(user.access_level === 'teacher'){
            console.log(user.access_level)
            const sqlQuery = "SELECT * FROM teachers WHERE name = ?";
            const rows = await pool.query(sqlQuery, [userName] ); 
            tId = rows[0].id;
            console.log(tId);
        }
        const access_level = user.access_level;
        if (user.password === password) {
            res.status(200).json({
                status: 'success',
                data: {
                    access_level,
                    tId
                }
            });
        } else {
            res.status(401).json({
                status: 'fail',
                message: 'Incorrect password'
            });
        }

    } catch (error) {
        console.error("Error in login:", error);
        res.status(500).json({ error: "Internal server error" });
    }
};
