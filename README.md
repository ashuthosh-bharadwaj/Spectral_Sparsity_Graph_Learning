# Spectral_Sparsity_Graph_Learning
Implementation of the 2 main algorithms in "Graph learning under Spectral Sparsity Constraints",  B. Subbareddy, Aditya Siripuram, Jingxin Zhang.

## Model of the Graph Spectral Sparsity
Given Graph signal sequence \( X \in \mathbb{R}^{N \times M} /) on graph \( \mathcal{G} = \mathcal{G}(\mathcal{V},\mathcal{E}) /) with \( |V| = N /), we consider the following:

$$
X = V_{\mathcal{G}}Y + \eta
$$

where $Y$ is k-sparse and is the _Graph Fourier Transform_ of $X$.

The following optimization problems are hence drafted
