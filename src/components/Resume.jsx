import './Resume.css';

function Resume() {
  const education = [
    { place: 'Stanford University', degree: 'MSc (Human Computer Interaction)', period: '2013-2015' },
    { place: 'MIT Summer School', degree: 'UX Training Bootcamp', period: '2013-2014' },
    { place: 'California State University', degree: 'BSc in Software Engineering', period: '2009-2012' },
  ];

  const experience = [
    { emoji: '🚀', bg: 'pink', company: 'SpaceFleet', role: 'Senior Product Designer', period: 'April 2019 - Current' },
    { emoji: '🎵', bg: 'blue', company: 'MusicMash', role: 'Information Architect', period: 'April 2016 - May 2017' },
    { emoji: '👑', bg: 'yellow', company: 'Kingdom', role: 'UI Designer', period: 'April 2016 - May 2017' },
  ];

  return (
    <section className="section section-soft">
      <div className="container">
        <div className="resume-grid">
          <div>
            <h3 className="resume-title">📚 Education</h3>
            {education.map((item) => (
              <a href="#" className="resume-item" key={item.place}>
                <div>
                  <div className="resume-place">{item.place}</div>
                  <div className="resume-degree">{item.degree}</div>
                </div>
                <span className="resume-period">{item.period}</span>
                <span className="resume-arrow">↗</span>
              </a>
            ))}
          </div>

          <div>
            <h3 className="resume-title">💼 Work Experience</h3>
            {experience.map((item) => (
              <a href="#" className="resume-item" key={item.company}>
                <div className="resume-item-main">
                  <div className={`resume-badge bg-${item.bg}`}>{item.emoji}</div>
                  <div>
                    <div className="resume-place">{item.company}</div>
                    <div className="resume-degree">{item.role}</div>
                  </div>
                </div>
                <span className="resume-period">{item.period}</span>
                <span className="resume-arrow">↗</span>
              </a>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}

export default Resume;
