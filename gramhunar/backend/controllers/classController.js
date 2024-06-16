const pool = require("../db");

exports.getClassAc = async (req, res) => {
    const id = req.params.classId;

    try {
      const sqlQuery = 'SELECT * FROM classes WHERE id = ?';
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

exports.getActivity = async(req, res)=>{
  const class_id = req.params.classId;

  try {
    const sqlQuery = 'SELECT * FROM activities_and_classes WHERE class_id = ?';
    const rows = await pool.query(sqlQuery, [class_id]);

    res.status(200).json({
      status: 'success',
      data: rows,
    });
  } catch (error) {
    console.error('Error in getting classes:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
}