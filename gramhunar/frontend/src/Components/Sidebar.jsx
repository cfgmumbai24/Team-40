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
      <ul className="sidebar-list">
        <li className="sidebar-item">Notes</li>
        <li className="sidebar-item">Calendar</li>
        <li className="sidebar-item">Charts</li>
      </ul>
      <hr className="sidebar-divider" />
      <ul className="sidebar-list">
        <li className="sidebar-item">Settings</li>
      </ul>
    </div>
  );
};

export default Sidebar;
