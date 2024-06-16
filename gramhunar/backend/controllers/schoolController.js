const pool = require("../db");

exports.getAll = async (req, res) => {
    try {

        const sqlQuery = "SELECT * FROM schools";
        const rows = await pool.query(sqlQuery, []); 
            res.status(200).json({
                status: 'success',
                data: rows
            });

    } catch (error) {
        console.error("Error in getting school:", error);
        res.status(500).json({ error: "Internal server error" });
    }
};

exports.getAllClassesForSchool = async (req, res) => {
    const id = req.params.id;
  
    try {
      const sqlQuery = 'SELECT * FROM schools WHERE id = ?';
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

exports.getClass = async (req, res) => {
    const school_id = req.params.schoolId;
  
    try {
      const sqlQuery = 'SELECT * FROM classes WHERE school_id = ?';
      const rows = await pool.query(sqlQuery, [school_id]);
  
      res.status(200).json({
        status: 'success',
        data: rows,
      });
    } catch (error) {
      console.error('Error in getting classes:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
};
exports.getClassAc = async (req, res) => {
    const class_id = req.params;

    try {
      const sqlQuery = 'SELECT * FROM classes WHERE class_id = ?';
      const rows = await pool.query(sqlQuery, [class_id]);
  
      res.status(200).json({
        status: 'success',
        data: rows,
      });
    } catch (error) {
      console.error('Error in getting classes:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
};