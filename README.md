# 🌱 GreenPowerHub

Welcome to **GreenPowerHub**, created by Alfonso Antonio Dávila Vera! As an electrical engineer with over 25 years of experience in power systems and distribution, I am passionate about advancing sustainable energy solutions. This repository is a hub for tools, simulations, and resources that promote the integration of renewable energy sources—such as solar PV and wind—while enhancing the efficiency, reliability, and safety of electrical power systems. Inspired by a vision of a greener future (see banner image), these efforts align with my EB-2 NIW professional plan to drive widespread renewable adoption and shape the future of energy infrastructure in the United States. Built on my expertise with tools like MATLAB, ETAP, DIALux, AutoCAD, Revit, and Dynamo, the content here is hosted under the MIT License. Explore below to contribute to a sustainable tomorrow—new resources are added regularly!

## 🌞 Mission
Launched on October 07, 2025, GreenPowerHub reflects my commitment to:
- Develop innovative tools for renewable energy integration.
- Enhance power system efficiency and reliability through data-driven simulations.
- Foster collaboration with diverse stakeholders (government, research, industry) to support U.S. energy transition.
- Contribute to economic growth, technology transfer, and environmental benefits as outlined in my professional plan.

## 🔧 Tools & Resources
Below is a growing collection of scripts and models supporting sustainable energy solutions.

### 1. Hybrid Renewable Energy Integration Simulator 🌬️☀️
- **File**: `Hybrid_Renewable_Integration.m`
- **Description**: A MATLAB script simulating a hybrid solar PV and wind energy system integrated into a power distribution grid. Launched today, October 07, 2025, it calculates power outputs based on irradiance, temperature, and wind speed, applies a basic MPPT approximation, and estimates daily energy yield and grid contribution. Saves results to CSV for MEP integration.
- **Benefits**: Saves 5–10 hours per analysis, supports NEC 2023-compliant designs, and aids renewable project planning.
- **Location**: `github.com/DynMEP/GreenPowerHub/tree/main/matlab`
- **Usage**: Run in MATLAB with customizable parameters (e.g., PV size, wind turbine specs).

### 2. [Future Addition] Renewable Load Optimizer 📊
- **Planned File**: `Renewable_Load_Optimizer.py`
- **Description**: A Python script to optimize load distribution for renewable energy systems, integrating with Dynamo for Revit MEP workflows. Planned to include demand factor calculations per NEC 220.
- **Benefits**: Enhances grid reliability, reduces over-design, and supports microgrid designs.
- **Status**: Under development; contributions welcome!

## 🛠️ Installation & Setup
### Prerequisites
- **MATLAB**: Base version (no toolboxes required for initial script).
- **Python** (for future scripts): Version 3.x, with libraries like NumPy, Pandas.
- **Revit/Dynamo** (optional): For MEP integration with future Python scripts.

### Setup
1. Clone the repo: `git clone https://github.com/DynMEP/GreenPowerHub.git`
2. Navigate to the desired folder (e.g., `/matlab` for MATLAB scripts).
3. Run scripts in their respective environments (MATLAB for `.m`, Python for `.py`).
4. Customize input data (e.g., irradiance, wind speed) based on project needs.

## 🚀 Usage
- **Hybrid_Renewable_Integration.m**: Open in MATLAB, adjust parameters (e.g., `PV_rated_power`, `wind_speed`), and run. Check `hybrid_energy_output.csv` for results.
- **Future Scripts**: Follow inline comments or wiki guides (to be added).

## 🎯 Benefits
- **Time Savings**: Reduce analysis time by 5–10 hours per project.
- **Sustainability Impact**: Support renewable adoption, reduce carbon footprint, and enhance U.S. energy resilience.
- **Economic Value**: Contribute to infrastructure development, R&D, and technology transfer.
- **NEC Compliance**: Ensure designs meet 2023 standards for safe integration.

## 🌍 Contributing to the U.S.
This repository aligns with my professional plan’s goals:
- **Economic Growth**: Streamlines renewable projects, boosting the $1.5T U.S. construction sector.
- **Technology Transfer**: Open-source tools enable adoption by MEP firms and researchers.
- **Environmental Benefits**: Optimizes resource use, reducing emissions and waste.

## 📜 License
Licensed under the MIT License. See LICENSE for details.

## 🤝 Let’s Collaborate
Got a renewable energy challenge or need custom simulations? Explore, fork, or contribute to `github.com/DynMEP/GreenPowerHub`! Submit pull requests, open issues, or reach out via GitHub Issues for consulting or custom development.

**Author**: Alfonso Antonio Dávila Vera  
**Email**: davila.alfonso@gmail.com  
**LinkedIn**: www.linkedin.com/in/alfonso-davila-3a121087  
**GitHub**: github.com/DynMEP  
**Website (Coming Soon)**: greenpowerhub.com  
**YouTube**: @GreenPowerHub  

“Let’s power a sustainable future together! 🌿⚡”
