import React from 'react';
import Card from './Card';
import './CardContainer.css';

const CardContainer = () => {
  const cardsData = [
    { heading: "Activity 1", subheading: "Description About Activity 1", text: "Outcomes from Activity 1" },
    { heading: "Activity 2", subheading: "Description About Activity 2", text: "Outcomes from Activity 2" },
    { heading: "Activity 3", subheading: "Description About Activity 3", text: "Outcomes from Activity 3" },
    { heading: "Activity 4", subheading: "Description About Activity 4", text: "Outcomes from Activity 4" },
    { heading: "Activity 5", subheading: "Description About Activity 5", text: "Outcomes from Activity 5" },
    { heading: "Activity 6", subheading: "Description About Activity 6", text: "Outcomes from Activity 6" },
  ];

  return (
    <div className="card-container">
      {cardsData.map((card, index) => (
        <Card
          key={index}
          heading={card.heading}
          subheading={card.subheading}
          text={card.text}
        />
      ))}
    </div>
  );
};

export default CardContainer;
