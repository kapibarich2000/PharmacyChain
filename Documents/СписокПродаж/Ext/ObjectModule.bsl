﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	
	Движения.АптечныйПункт_Потрибитель.Записывать = Истина;
	Движения.РегистрПрибыли.Записывать = Истина;
	Движения.ОборотыПродаж.Записывать = Истина;
	
	Для Каждого ТекСтрокаКорзина Из Корзина Цикл
		// регистр АптечныйПункт_Потрибитель Расход
		Движение = Движения.АптечныйПункт_Потрибитель.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.АптечныйПункт = АптечныйПункт;
		Движение.Товар = ТекСтрокаКорзина.Товар;
		Движение.Количество = ТекСтрокаКорзина.Количество;
		
		// регистр РегистрПрибыли Расход
		Движение = Движения.РегистрПрибыли.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Товар = ТекСтрокаКорзина.Товар;
		Движение.Количество = ТекСтрокаКорзина.Количество;
		Движение.Сумма = ТекСтрокаКорзина.Сумма;
		
		
		//регистр ОборотыПродажи
		Движение = Движения.ОборотыПродаж.Добавить();
		Движение.Период = Дата;
		Движение.Товар = ТекСтрокаКорзина.Товар;
		Движение.Покупатель=Покупатель;
		Движение.АптечныйПункт=АптечныйПункт;
		Движение.Продавец=Продавец;
		Движение.Количество=ТекСтрокаКорзина.Количество;
		Движение.Выручка=ТекСтрокаКорзина.Сумма;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
