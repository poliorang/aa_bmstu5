import matplotlib.pyplot as plt
import numpy as np

if __name__ == "__main__":
    fig, ax = plt.subplots(3, 1, figsize=(7, 10))

    xx = [500.0, 750.0, 1000.0, 1250.0, 1500.0, 1750.0, 2000.0]

    bitree1 = [0.0021, 0.0038, 0.0048, 0.0061, 0.0072, 0.0082, 0.0106]
    shaker1 = [0.1313, 0.3305, 0.5272, 0.8101, 1.1723, 1.7372, 2.5861]
    bucket1 = [0.0069, 0.0121, 0.0204, 0.0286, 0.0383, 0.0511, 0.0656]

    ax[0].plot(xx, bucket1, '-o', label='Блочная')
    ax[0].plot(xx, shaker1, '-ro', label='Перемешиванием')
    ax[0].plot(xx, bitree1, '-go', label='Бинарным деревом')
    ax[0].set(title='Массивы из случайных чисел')
    ax[0].legend()

    bucket2 = [0.0033, 0.0052, 0.0066, 0.0098, 0.0109, 0.0116, 0.0135]
    shaker2 = [0.0944, 0.2581, 0.4021, 0.6588, 1.1394, 1.3223, 1.7849]
    bitree2 = [0.0458, 0.1061, 0.2084, 0.3221, 0.4929, 0.5063, 0.8165]

    ax[1].plot(xx, bucket2, '-o', label='Блочная')
    ax[1].plot(xx, shaker2, '-ro', label='Перемешиванием')
    ax[1].plot(xx, bitree2, '-go', label='Бинарным деревом')
    ax[1].set(title='Массивы отсортированные')
    ax[1].legend()

    bucket3 = [0.0036, 0.0051, 0.0081, 0.0099, 0.0103, 0.0117, 0.0135]
    shaker3 = [0.2136, 0.5488, 0.8875, 1.2612, 1.6534, 2.3841, 2.7928]
    bitree3 = [0.1041, 0.1399, 0.1849, 0.3215, 0.4063, 0.4865, 0.6994]

    ax[2].plot(xx, bucket3, '-o', label='Блочная')
    ax[2].plot(xx, shaker3, '-ro', label='Перемешиванием')
    ax[2].plot(xx, bitree3, '-go', label='Бинарным деревом')
    ax[2].set(title='Массивы, отсортированные в обратном порядке')
    ax[2].legend()

    fig.tight_layout()

    ax[0].set_ylabel("Время (сек)", fontsize=8)
    ax[0].set_xlabel("Количество элементов", fontsize=8)

    ax[1].set_ylabel("Время (сек)", fontsize=8)
    ax[1].set_xlabel("Количество элементов", fontsize=8)

    ax[2].set_ylabel("Время (сек)", fontsize=8)
    ax[2].set_xlabel("Количество элементов", fontsize=8)

    plt.show()
    fig.savefig('saved_figure-100dpi.png', dpi = 100)
