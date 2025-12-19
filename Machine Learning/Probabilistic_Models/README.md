# Probabilistic Learning and Pattern Recognition on Movie Data

This project was developed within the scope of the **Probabilistic Learning and Pattern Recognition** course and focuses on the application of **probabilistic models** and **generative deep learning techniques** to analyze and model data from the movie industry.

The project explores two complementary approaches:
- **Bayesian Networks** for probabilistic reasoning and inference
- **Variational Autoencoders (VAE / cVAE)** for image generation and representation learning

Datasets were obtained from **IMDB** and **MovieLens**.

---

## 🎯 Project Objectives

- Apply probabilistic modeling techniques to real-world data
- Construct and analyze **Bayesian Networks**
- Perform probabilistic inference and reasoning
- Implement **Variational Autoencoders (VAE)** for image generation
- Explore **Conditional VAEs (cVAE)** for controlled image generation
- Gain insights into financial and structural patterns in the movie industry

---

## 📊 Datasets

### Part 1 — Tabular Movie Data
- Movie scores
- Budgets
- Revenues
- Genres
- Countries
- Original language
- Release dates
- Status

Sources: **IMDB**

### Part 2 — Images and Ratings
- Movie posters (images)
- User ratings

Sources: **MovieLens**

---

## 🧠 Project Structure

The project is divided into **two main parts**:

---

## 🔹 Part 1 — Bayesian Network

### Data Processing
- Handling missing genres by introducing an *unknown* category
- Removal of irrelevant attributes (`crew`, `overview`, `original_title`)
- Descriptive statistical analysis
- Visualization of distributions and outliers
- Correlation analysis between variables

### Bayesian Network Construction
The Bayesian Network models relationships between key variables such as:
- Budget
- Revenue
- Country
- Original language
- Genre
- Movie status
- Score

The structure was defined based on correlation analysis, enabling effective probabilistic reasoning.

### Inference
Several probabilistic inferences were performed, including:
- Revenue probability distributions under different conditions
- Impact of budget, country, and language on expected revenue

This analysis provides insights into factors influencing movie success.

---

## 🔹 Part 2 — Variational Autoencoders (VAE & cVAE)

### Data Preparation
- Merging movie metadata with ratings
- Removing low-rated and duplicate movies
- Poster image resizing
- Pixel normalization
- Train/test split

### Variational Autoencoder (VAE)
- Convolutional encoder–decoder architecture
- Latent space sampling using mean and log-variance
- Loss function combining reconstruction loss and KL divergence
- Image reconstruction and generation

### Conditional VAE (cVAE)
- Conditioning image generation on movie genres
- Multi-label genre encoding
- Generation of new images based on a selected genre (e.g., *Action*)

---

## 🛠️ Technologies Used

- **Python**
- `pandas`, `numpy`
- `matplotlib`, `seaborn`
- `scikit-learn`
- **Bayesian Networks**
- **TensorFlow / Keras**
- **Convolutional Neural Networks**
- **Variational Autoencoders (VAE)**
- **Conditional VAE (cVAE)**

---

## 📈 Results & Conclusions

- Bayesian Networks provided meaningful probabilistic insights into movie revenue dynamics
- VAE models require long training times to achieve high-quality reconstructions
- The standard **VAE outperformed the cVAE** in reconstruction quality
- Generative models demonstrated strong potential for image synthesis and representation learning

---

## 📌 Conclusion

This project demonstrates the practical application of **probabilistic modeling** and **unsupervised deep learning** techniques to real-world datasets, combining statistical reasoning with modern generative models.

---

## 👤 Authors

- Guilherme Cardoso

