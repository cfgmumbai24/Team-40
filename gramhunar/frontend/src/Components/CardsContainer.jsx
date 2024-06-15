import React from 'react';
import './CardsContainer.css';

const CardsContainer = () => {
  return (
    <>
    <div className="cards-container">
            <div className="card">
                <div className="card-title">

                    Numeic Sccore
                </div>

                    <div className="content">30</div>
            </div>
      
            <div className="card">
                <div className="card-title">

                    Literacty Score
              </div>


              <div className="content">30</div>
              </div>

        <div className="card">

      <div className="card-title">

          Learning Outcomes
      </div>
        <div className="content">30</div>
      </div>

    </div>
    <hr className='hr-cardcontainer' />
    </>
    
  );
};

export default CardsContainer;