import './Hero.css';

function Hero() {
  return (
    <section className="hero">
      <div className="container">
        <div className="hero-grid">
          <div>
            <h1 className="hero-title">
              I design products<br />
              that delight and<br />
              inspire people.
            </h1>

            <p className="hero-subtitle">
              Hi! I'm Jake, a product designer based in Berlin.
              I create user-friendly interfaces for fast-growing startups.
            </p>

            <div className="hero-actions">
              <a href="#footer" className="btn btn-primary">Book a call</a>
              <a href="#" className="btn btn-ghost">
                Download CV <span className="arrow">→</span>
              </a>
            </div>
          </div>

          <div className="hero-right">
            {/* 🖼️ КАРТИНКА — замени ссылку на свою */}
            <img
              src="/images/hero.png"
              alt="Jake"
            />
          </div>
        </div>

        <div className="hero-trusted">
          <p className="hero-trusted-label">Trusted by</p>
          <div className="hero-logos">
<img src="/images/logoipsum-1.svg " alt="Logo"></img>
<img src="/images/logoipsum-2.svg " alt="Logo"></img>
<img src="/images/logoipsum-3.svg " alt="Logo"></img>
<img src="/images/logoipsum-4.svg " alt="Logo"></img>

          </div>
        </div>
      </div>
    </section>
  );
}

export default Hero;
