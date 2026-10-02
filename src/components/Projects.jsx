import './Projects.css';

function Projects() {
  const projects = [
    {
      tag: 'Branding',
      title: 'Soulful Rebrand',
      image: '/images/project-1.png',
    },
    {
      tag: 'Product Design',
      title: 'Datadash Product design',
      image: '/images/project-2.png',
    },
    {
      tag: 'Web Design',
      title: 'Maize Website Design',
      image: '/images/project-3.png',
    },
  ];

  return (
    <section className="section" id="projects">
      <div className="container">
        <div className="projects-head">
          <div>
            <p className="eyebrow-purple">Projects</p>
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
