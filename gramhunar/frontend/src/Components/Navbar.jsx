import React from "react";
import { Link } from "react-router-dom";

const Navbar = () => {
  return (
    <nav
      style={{
        display: "flex",
        justifyContent: "space-between",
        alignItems: "center",
        padding: "10px",
        backgroundColor: "#f0f0f0",
      }}
    >
      <div style={{ display: "flex", alignItems: "center" }}>
        <img
          src="https://www.gramurja.org/assets/images/logo/Gram%20Urja%20logo.png"
          alt="Logo"
          style={{ height: "40px", marginRight: "10px" }}
        />
        <Link to={"/schools/1/classes"}>
          <h1 style={{ fontSize: "20px" }}>Gramhunar</h1>
        </Link>
      </div>
      <Link to={"/add-activity"}>
        <button
          style={{
            padding: "10px 20px",
            backgroundColor: "#007bff",
            color: "white",
            border: "none",
            borderRadius: "5px",
            cursor: "pointer",
          }}
        >
          Add Activity
        </button>
      </Link>
      <Link to={"/"}>
        <button
          style={{
            padding: "10px 20px",
            margin: "10px",
            backgroundColor: "#007bff",
            color: "white",
            border: "none",
            borderRadius: "5px",
            cursor: "pointer",
          }}
        >
          Logout
        </button>
      </Link>
    </nav>
  );
};

export default Navbar;
