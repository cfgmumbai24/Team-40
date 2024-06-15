import React from 'react';
import './Sidebar.css';

const Sidebar = () => {
  return (
    <div className="sidebar">

      <hr className="sidebar-divider" />
      <ul className="sidebar-list">
        <li className="sidebar-item">Classes</li>
        <li className="sidebar-item">Students</li>
        <li className="sidebar-item">Activities</li>
      </ul>
    </div>
  );
};

export default Sidebar;
