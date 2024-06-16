const mongoose = require("mongoose");

const TeacherSchema = new mongoose.Schema(
  {
    username: {
      type: String,
      unique: true,
      required: true,
    },
    password: {
      type: String,
      required: true,
    },
    classes: [{ type: Schema.Types.ObjectId, ref: "Class" }],
  },
  { timestamps: true }
);
