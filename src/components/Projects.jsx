import './Projects.css';

function Projects() {
  const projects = [
    {
      tag: 'Branding',
      title: 'Soulful Rebrand',
      // 🖼️ КАРТИНКА
      image: 'https://images.unsplash.com/photo-1558655146-9f40138edfeb?w=500',
    },
    {
      tag: 'Product Design',
      title: 'Datadash Product design',
      // 🖼️ КАРТИНКА
      image: 'https://images.unsplash.com/photo-1618761714954-0b8cd0026356?w=500',
    },
    {
      tag: 'Web Design',
      title: 'Maize Website Design',
      // 🖼️ КАРТИНКА
      image: 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=500',
    },
  ];

  return (
    <section className="section" id="projects">
      <div className="container">
        <div className="projects-head">
          <div>
            <p className="eyebrow eyebrow-purple">Projects</p>
            <h2 className="projects-title">
              I bring results.<br />
              My clients are proof.
            </h2>
          </div>
          <a href="#" className="projects-view-all">View all projects</a>
        </div>

        <div className="projects-grid">
          {projects.map((project) => (
            <a href="#" className="project-card" key={project.title}>
              <img src={project.image} alt={project.title} />
              <div>
                <span className="project-tag">{project.tag}</span>
                <h3>{project.title}</h3>
                <span className="project-link">View Project →</span>
              </div>
            </a>
          ))}
        </div>
      </div>
    </section>
  );
}

export default Projects;
