import './Resume.css';

function Resume() {
  const education = [
    { place: 'Stanford University', degree: 'MSc (HCI)', period: '2013-2015' },
    { place: 'MIT Summer School', degree: 'UX Bootcamp', period: '2013-2014' },
    { place: 'California State University', degree: 'BSc Software Engineering', period: '2009-2012' },
  ];

  const experience = [
    { icon: '🚀', bg: 'pink', company: 'SpaceFleet', role: 'Senior Product Designer', period: '2019 - Present' },
    { icon: '🎵', bg: 'blue', company: 'MusicMash', role: 'Information Architect', period: '2016 - 2017' },
    { icon: '👑', bg: 'yellow', company: 'Kingdom', role: 'UI Designer', period: '2016 - 2017' },
  ];

  return (
    <section className="section section-soft">
      <div className="container">
        <div className="resume-grid">
          
          {/* Образование */}
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

          {/* Опыт работы */}
          <div>
            <h3 className="resume-title">💼 Work Experience</h3>
            {experience.map((item) => (
              <a href="#" className="resume-item" key={item.company}>
                <div className="resume-item-main">
                  <div className={`resume-badge bg-${item.bg}`}>{item.icon}</div>
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
