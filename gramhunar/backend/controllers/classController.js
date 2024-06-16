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
    const sqlQuery = `
       SELECT 
        activities_and_classes.id AS activities_and_classes_id,
        activities_and_classes.date,
        activities_and_classes.activity_id,
        activities_and_classes.class_id,
        activities.name AS activity_name,
        activities.description AS activity_desc,
        activities.numeric_weightage,
        activities.literature_weightage,
        activities.emotional_weightage
      FROM activities_and_classes 
      JOIN activities ON activities_and_classes.activity_id = activities.id 
      WHERE activities_and_classes.class_id = ?;
    `;
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

exports.createActivityById = async(req, res)=>{
  const {id, classId, activityId} = req.body;
   try{
    const sqlQuery = 'INSERT INTO activities_and_classes (id, date, activity_id, class_id) values (?,?,?,?)';
    const result = await pool.query(sql, [id, Date.time(),, activityId, classId]);

    res.status(201).json({
      status:'success',
      data: {
        result
      }
   });
  
   }catch(err){
    console.error('Error creating activity:', err);
    res.status(500).json({ error: 'Internal server error' });
   }
}