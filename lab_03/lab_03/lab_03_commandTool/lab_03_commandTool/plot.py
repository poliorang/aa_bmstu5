import matplotlib.pyplot as plt

if __name__ == "__main__":

    x = [500, 750, 1000, 1250, 1500, 1750, 2000]
    bucket = [0.0021, 0.0038, 0.0048, 0.0061, 0.0072, 0.0082, 0.0106]
    shaker = [0.1313, 0.3305, 0.5272, 0.8101, 1.1723, 1.7372, 2.5861]
    bitree = [0.0069, 0.0121, 0.0204, 0.0286, 0.0383, 0.0511, 0.0656]


    fig = plt.figure(figsize = (10, 7))
    plot = fig.add_subplot()
    plot.plot(len(bucket), bucket, label = "Блочная")
    # plot.plot(len_arr, y_time_lev_matrix_rec, label = "Р-Левенштейна(рек+кеш)")
    # plot.plot(len_arr, y_time_lev_matrix, label = "Р-Левенштейна(мат)")
    # plot.plot(len_arr, y_time_dlev, label = "Р-Дамерау-Левенштейна")
    plt.legend()
    plt.grid()
    plt.title("Временные характеристики алгоритмов сортировки")
    plt.ylabel("Затраченное время (ск)")
    plt.xlabel("Количество элементов")

    #
    # fig1 = plt.figure(figsize = (10, 7))
    # plot = fig1.add_subplot()
    # # plot.plot(len_arr, y_time_lev_rec, label = "Р-Левенштейна(рек)")
    # plot.plot(len_arr, y_time_lev_matrix_rec, label = "Р-Левенштейна(рек+кеш)")
    # plot.plot(len_arr, y_time_lev_matrix, label = "Р-Левенштейна(мат)")
    # # plot.plot(len_arr, y_time_dlev, label = "Р-Дамерау-Левенштейна")
    # plt.legend()
    # plt.grid()
    # plt.title("Временные характеристики алгоритмов вычисления расстояния")
    # plt.ylabel("Затраченное время (мск)")
    # plt.xlabel("Длина (симболы")
    plt.show()