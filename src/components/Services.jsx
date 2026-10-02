import './Services.css';

function Services() {
  return (
    <section className="section section-soft" id="services">
      <div className="container">
        <p className="eyebrow eyebrow-orange">Services</p>
        <h2 className="section-title section-title-center">
          Design that solves problems,<br />one product at a time.
        </h2>

        <div className="services-grid">
          <div className="services-col">
            <h3>What I can do for you</h3>
            <p>Faster, better products that your users love. Here's all the services I provide:</p>
            <ul>
              <li>Design Strategy</li>
              <li>Web and Mobile App Design</li>
              <li>Front-end Development</li>
            </ul>
          </div>

          <div className="services-col">
            <h3>Applications I'm fluent in</h3>
            <p>Every designer needs the right tools to do the perfect job. Thankfully, I'm multilingual.</p>
            <ul>
              <li>Sketch</li>
              <li>Webflow</li>
              <li>Figma</li>
            </ul>
          </div>

          <div className="services-col">
            <h3>What you can expect</h3>
            <p>I design products that are more than pretty. I make them shippable and usable.</p>
            <ul>
              <li>Clean and functional</li>
              <li>Device and user friendly</li>
              <li>Efficient and maintainable</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Services;
