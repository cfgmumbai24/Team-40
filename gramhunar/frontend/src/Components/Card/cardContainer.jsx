import React from 'react';
import Card from './Card';
import './CardContainer.css';

const CardContainer = () => {
  const cardsData = [
    { heading: "Card 1", subheading: "Subheading 1", text: "Some text for card 1." },
    { heading: "Card 2", subheading: "Subheading 2", text: "Some text for card 2." },
    { heading: "Card 3", subheading: "Subheading 3", text: "Some text for card 3." },
    { heading: "Card 4", subheading: "Subheading 4", text: "Some text for card 4." },
    { heading: "Card 5", subheading: "Subheading 5", text: "Some text for card 5." },
    { heading: "Card 6", subheading: "Subheading 6", text: "Some text for card 6." },
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
