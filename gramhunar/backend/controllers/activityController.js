const pool = require("../db");

// exports.createActivity = async (req, res) => {
//     const { name, description, weightage } = req.body;
  
//     try {
//       const sql = `INSERT INTO activities (name, description, weightage) VALUES (?, ?, ?)`;
//       const result = await pool.query(sql, [id, name, description, weightage]);
  
//       res.status(201).json({
//         status: 'success',
//         data: {
//           activity_id: result.insertId,
//           name,
//           description,
//           weightage
//         }
//       });
//     } catch (err) {
//       console.error('Error creating activity:', err);
//       res.status(500).json({ error: 'Internal server error' });
//     }
// };

exports.getAll = async (req, res) => {
  
    try {
      const sqlQuery = 'SELECT * FROM activities';
      const rows = await pool.query(sqlQuery, []);

      res.status(200).json({
        status: 'success',
        data: rows,
      });

    } catch (error) {
      console.error('Error in getting activity:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  };