import React from 'react';
import './Card.css';

const Card = ({ heading, subheading, text }) => {
  return (
    <div className="card">
      <h2 className="card-heading">{heading}</h2>
      <h3 className="card-subheading">{subheading}</h3>
      <p className="card-text">{text}</p>
    </div>
  );
};

export default Card;
