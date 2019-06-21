import numpy as np
from scipy.stats import norm, t



def sample_statistics(sample):
    """Calculates sample statistics from sample
    
    Args:
        sample (np.array): 1-dimensional array with numeric sample values
    
    Returns:
        (int, float, float): Tuple of sample size, sample mean, sample standard deviation
    """
    n = len(sample)
    mean = sum(sample) / n
    s = np.sqrt(sum((sample - mean) ** 2) / (n - 1))
    
    return n, mean, s

assert sample_statistics(np.array([1.1, 5.22, 8.25, 3.00, 3.39, 3.89, 2.2])) == (7, 3.8642857142857143, 2.3258034965925014)



def zscore_critical(p, twosided = False):
    """Calculates z-score from confidence level p
    
    Args:
        p (float): Confidence level
        twosided (bool): True for twosided confidence interval, False for onesided

    Returns:
        float: z-score
    """
    if not (p >= 0 and p <=1):
        raise ValueError("Invalid value for p")
    
    if twosided:
        return norm.ppf((1 + p) / 2)
    else:
        return norm.ppf(p)    
        
assert (zscore_critical(p=0.95, twosided=True) == 1.959963984540054)
assert (zscore_critical(p=0.5, twosided=False) == 0.0)
assert (zscore_critical(p=0.95, twosided=False) == 1.6448536269514722)



def tscore_critical(p, degrees, twosided = False):
    """Calculates t-score from confidence level p and degrees of freedom
    
    Args:
        p (float): Confidence level
        degrees (int): Degrees of freedom
        twosided (bool): True for twosided confidence interval, False for onesided

    Returns:
        float: z-score
    """
    if not (p >= 0 and p <=1):
        raise ValueError("Invalid value for p")
        
    if twosided:
        return t.ppf((1 + p) / 2, degrees)
    else:
        return t.ppf(p, degrees)

assert (tscore_critical(p = 0.95, degrees=10, twosided=False) == 1.8124611228107335)
assert (tscore_critical(p = 0.95, degrees = 1000000, twosided=True) == 1.9599663568141066)