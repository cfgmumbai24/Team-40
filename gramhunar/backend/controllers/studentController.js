const pool = require("../db");

exports.getAll = async (req, res) => {
    try {

        const sqlQuery = "SELECT * FROM students";
        const rows = await pool.query(sqlQuery, []); 
            res.status(200).json({
                status: 'success',
                data: rows
            });

    } catch (error) {
        console.error("Error in getting students:", error);
        res.status(500).json({ error: "Internal server error" });
    }
};


exports.getAllClassesForSchool = async (req, res) => {
    const class_id = req.params.classId;
    try {
      const sqlQuery = 'SELECT * FROM students WHERE class_id = ?';
      const rows = await pool.query(sqlQuery, [class_id]);
  
      res.status(200).json({
        status: 'success',
        data: rows,
      });
    } catch (error) {
      console.error('Error in getting students:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  };
exports.getClassAc = async (req, res) => {
    const id = req.params.id;

    try {
      const sqlQuery = 'SELECT * FROM students WHERE id = ?';
      const rows = await pool.query(sqlQuery, [id]);
  
      res.status(200).json({
        status: 'success',
        data: rows,
      });
    } catch (error) {
      console.error('Error in getting classes:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
};