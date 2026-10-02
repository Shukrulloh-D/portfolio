import { useState } from 'react';
import './Testimonials.css';

function Testimonials() {
  const items = [
    {
      quote: "Jade helped us build a software so intuitive that it didn't need a walkthrough. He solved complex problems with brilliant design.",
      author: 'John Franklin',
      role: 'Founder, Double Bunch',
      // 🖼️ КАРТИНКА
      photo: 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=500',
    },
    {
      quote: 'Working with Jake was a game-changer. He took our vague ideas and turned them into a design system we still use today.',
      author: 'Maria Lopez',
      role: 'Product Lead, Nova',
      // 🖼️ КАРТИНКА
      photo: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500',
    },
  ];

  const [index, setIndex] = useState(0);
  const item = items[index];

  const next = () => setIndex(index === items.length - 1 ? 0 : index + 1);
  const prev = () => setIndex(index === 0 ? items.length - 1 : index - 1);

  return (
    <section className="section">
      <div className="container">
        <p className="eyebrow eyebrow-purple">Testimonials</p>
        <h2 className="testimonials-title">Word on the street</h2>

        <div className="testimonials-wrap">
          <div className="testimonials-photo">
            <img src={item.photo} alt={item.author} />
            <div className="testimonials-nav">
              <button onClick={prev}>←</button>
              <button onClick={next}>→</button>
            </div>
          </div>

          <div>
            <p className="testimonials-quote">{item.quote}</p>
            <div className="testimonials-author">
              <span className="testimonials-author-name">{item.author}</span>
              <span className="testimonials-author-role">{item.role}</span>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Testimonials;
