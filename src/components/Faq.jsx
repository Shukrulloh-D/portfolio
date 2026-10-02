import { useState } from 'react';
import './Faq.css';

function Faq() {
  const faqs = [
    { q: 'What type of projects do you take on?', a: 'Mostly product design for SaaS, mobile apps and design systems.' },
    { q: 'How do you charge for projects?', a: 'Fixed price per project or monthly retainer — depends on scope.' },
    { q: 'What is your hourly rate?', a: '$80/hour for freelance, discounted for long-term contracts.' },
    { q: 'What does your design process look like?', a: 'Research, wireframes, high-fidelity UI, prototype, handoff.' },
    { q: 'What time-zone do you work in?', a: 'CET (Berlin). I overlap 4+ hours with US East Coast.' },
    { q: 'What metrics do you use to measure success?', a: 'Conversion, retention, task success rate and NPS.' },
    { q: 'What is the typical timeline for a project?', a: '2–8 weeks depending on the scope of work.' },
    { q: 'What if I need help after the project is complete?', a: 'You get 30 days of free support after the handoff.' },
  ];

  const [openIndex, setOpenIndex] = useState(-1);

  const toggle = (index) => {
    setOpenIndex(openIndex === index ? -1 : index);
  };
 
  return (
    <section className="section section-dark">
      <div className="container">
        <p className="eyebrow eyebrow-orange">FAQ</p>
        <h2 className="faq-title">Frequently asked questions</h2>

        <div className="faq-grid">
          {faqs.map((item, index) => (
            <div className="faq-item" key={index}>
              <button className="faq-header" onClick={() => toggle(index)}>
                <span>{item.q}</span>
                <span className={`faq-icon ${openIndex === index ? 'open' : ''}`}>⌄</span>
              </button>
              {openIndex === index && <p className="faq-body">{item.a}</p>}
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}

export default Faq;
