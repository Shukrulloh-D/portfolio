import './About.css';

function About() {
  const photos = [
    // 🖼️ КАРТИНКИ — замени на свои
    '/images/about-1.png',
    '/images/about-2.png',
    '/images/about-3.png',
    '/images/about-4.png',
  ];

  return (
    <section className="section" id="about">
      <div className="container">
        <div className="about-head">
          <div>
            <p className="eyebrow eyebrow-orange">Product Designer</p>
            <h2 className="about-title">That's me!</h2>
          </div>
          <p className="about-description">
            Over the past 12 years, I've worked with a diverse range of clients,
            from startups to Fortune 500 companies. I love crafting interfaces
            that delight users and help businesses grow.
          </p>
        </div>

        <div className="about-gallery">
          {photos.map((photo, i) => (
            <img key={i} src={photo} alt="" />
          ))}
        </div>
      </div>
    </section>
  );
}

export default About;
