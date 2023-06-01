# Polynomial Curve Fitting

This repository contains a MATLAB project for polynomial curve fitting using the Particle Swarm Optimization (PSO) algorithm.

## Description

The Polynomial Curve Fitting project aims to fit a polynomial curve to a given set of data points using the PSO algorithm. The project consists of the following scripts:

- `CreateModel.m`: This script generates the data for curve fitting and saves it as `Model.mat`.
- `Main.m`: This script reads the generated data, allows you to specify the degree of the polynomial curve, and applies the PSO algorithm to fit the curve.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Ilia-Abolhasani/polynomial-curve-fitting.git
2. Open MATLAB software.

3. Set the current directory to the location where you have cloned the repository.

## Usage

To use the Polynomial Curve Fitting program, follow these steps:

1. Run the `CreateModel.m` script.

   - This script generates the data required for curve fitting and saves it as `Model.mat`.

2. Open the `Main.m` script in MATLAB.

3. Load the generated data by uncommenting the relevant code or use your own data.

4. Specify the degree of the polynomial curve you want to fit by setting the `Degree` variable.

   - Choose from the following values: 1, 2, 3.

5. Run the `Main.m` script.

   - The program applies the PSO algorithm to fit the polynomial curve to the data.

6. The fitted curve will be displayed on a graph.

7. Analyze the results and evaluate the quality of the curve fitting for different degree values.

## Contributing

Contributions are welcome! If you would like to contribute to this project, please follow these steps:

1. Fork the repository.

2. Create a new branch for your feature or bug fix.

3. Make your changes and commit them with descriptive messages.

4. Push your changes to your forked repository.

5. Submit a pull request explaining your changes.

Please ensure that your contributions align with the coding standards and guidelines followed in this project.

## License

This project is licensed under the [MIT License](LICENSE).
