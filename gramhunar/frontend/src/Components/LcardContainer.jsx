import React from 'react'
import './LcardContainer.css'

const LcardContainer = () => {
  return (
    <>
    <div className="cards-container">
            <div className="card">
                <div className="card-title">

                    Activity Score 1
                </div>

                    <div className="content">30</div>
            </div>
      
            <div className="card">
                <div className="card-title">

                Activity Score 2
                </div>


              <div className="content">30</div>
              </div>

        <div className="card">

      <div className="card-title">

      Activity Score 3
      </div>
        <div className="content">30</div>
      </div>

    </div>
    <hr className='hr-cardcontainer' />
    </>
    
  );
};

export default LcardContainer
