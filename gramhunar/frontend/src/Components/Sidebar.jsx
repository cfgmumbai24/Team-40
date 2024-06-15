import React from 'react';
import './Sidebar.css';

const Sidebar = () => {
  return (
    <div className="sidebar">
      <h1 className="sidebar-heading">Main</h1>
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
      <ul className="sidebar-list">
        <li className="sidebar-item">Settings</li>
      </ul>
    </div>
  );
};

export default Sidebar;
