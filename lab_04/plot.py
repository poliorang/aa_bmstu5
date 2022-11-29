import matplotlib.pyplot as plt


def plot1():
    fig, ax = plt.subplots(3, 1, figsize=(7, 10))

    xx = [1, 4, 8, 16, 32, 64]

    usual1 = [1.3204 for _ in range(6)]
    threads1 = [1.3204, 1.0098, 1.2321, 1.2935, 1.3028, 1.2980]

    ax[0].plot(xx, usual1, '-o', label='Однопоточная')
    ax[0].plot(xx, threads1, '-ro', label='Многопоточная')
    ax[0].set(title='Массив из 10000 элементов')
    ax[0].legend()

    usual2 = [18.5843 for _ in range(6)]
    threads2 = [18.5843, 5.5141, 7.2482, 8.3376, 8.3464, 8.4265]

    ax[1].plot(xx, usual2, '-o', label='Однопоточная')
    ax[1].plot(xx, threads2, '-ro', label='Многопоточная')
    ax[1].set(title='Массив из 30000 элементов')
    ax[1].legend()

    usual3 = [51.2648 for _ in range(6)]
    threads3 = [51.2648, 14.7643, 15.2290, 15.9671, 17.0147, 19.9160]

    ax[2].plot(xx, usual3, '-o', label='Однопоточная')
    ax[2].plot(xx, threads3, '-ro', label='Многопоточная')
    ax[2].set(title='Массив из 50000 элементов')
    ax[2].legend()

    fig.tight_layout()

    ax[0].set_ylabel("Время (мс)", fontsize=8)
    ax[0].set_xlabel("Количество потоков", fontsize=8)

    ax[1].set_ylabel("Время (мс)", fontsize=8)
    ax[1].set_xlabel("Количество потоков", fontsize=8)

    ax[2].set_ylabel("Время (мс)", fontsize=8)
    ax[2].set_xlabel("Количество потоков", fontsize=8)

    plt.show()

    fig.savefig('Plot.png', dpi=100)


def plot2():
    len_arr = [10000, 20000, 30000, 40000, 50000]
    result1 = [1.3653, 6.7280, 18.5843, 32.6369, 51.2648]
    result2 = [1.0098, 2.8004, 5.5141, 9.4126, 14.7643]

    fig1 = plt.figure(figsize=(10, 7))
    plot = fig1.add_subplot()
    plot.plot(len_arr, result1, '-o', label="Однопоточный")
    plot.plot(len_arr, result2, '-ro', label="Многопоточный")
    plt.legend()
    plt.grid()
    plt.title("Временные характеристики")
    plt.ylabel("Затраченное время (мс)")
    plt.xlabel("Длина")

    plt.show()
    plt.savefig('Plot2.png')


if __name__ == "__main__":
    plot1()
    plot2()
