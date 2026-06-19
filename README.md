# Assignment 1: The Clinical Pipeline Challenge

## Section 1: Biomarker Identification
Out of the three biomarkers, **Gene_A** stands out with an unusual pattern. Within the Normal patient group, most individuals show low expression levels, but a smaller subset shows very high values. This creates a split distribution that is not seen in Gene_B or Gene_C.

## Section 2: The Biological Paradox
Looking only at the boxplot, Gene_A in the Normal group seems fairly consistent. But when the individual data points are plotted with jitter, the real story appears: most healthy patients cluster at low expression, while a handful of outliers spike to very high levels. This contrast between the summary view and the raw points is the paradox — the group looks uniform until you examine the individuals.

## Section 3: The Biomedical Engineering Design Flaw
If someone compared Normal and Tumor groups using only the arithmetic mean of Gene_A, the result would be misleading. The outliers in the Normal group push the mean upward, making it appear closer to Tumor levels. Clinically, this could cause **false positives**, where healthy patients are incorrectly flagged as diseased. In a bimodal distribution like this, relying on a flat mean hides the variance and risks dangerous diagnostic errors. A more robust statistical approach is needed to avoid misclassification.
save.image("First Assignment2.RData")
