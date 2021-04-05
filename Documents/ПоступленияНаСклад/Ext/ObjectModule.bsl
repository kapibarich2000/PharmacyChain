﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	Движения.Склад_АптечныйПункт.Записывать = Истина;
	Движения.РегистрПрибыли.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		// регистр ОстаткиТоваров Приход
		Движение = Движения.Склад_АптечныйПункт.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Товар = ТекСтрокаТовары.Наименование;
		Движение.Склад = Склад;
		Движение.Количество = ТекСтрокаТовары.Количество;
		
		// регистр РегистрПрибыли Приход
		Движение=Движения.РегистрПрибыли.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Товар = ТекСтрокаТовары.Наименование;
		Движение.Количество=ТекСтрокаТовары.Количество;
		Движение.Сумма = ТекСтрокаТовары.Сумма*(-1);
		
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры


Процедура ПриЗаписи(Отказ)
	Если НЕ ЗначениеЗаполнено(СсылкаНаБизнесПроцесс) Тогда
	
	НовыйБизнесПроцессПоставкиНаСклад = БизнесПроцессы.ПоставкаТовараНаСклад.СоздатьБизнесПроцесс();
	
	// shift+F9 - отладка
	ТаблицаТоваров = Товары.Выгрузить();
	// Заполняем табл часть БП
	Для Каждого СтрТаблТов Из ТаблицаТоваров Цикл
		//Добавляет строку в конец табличной части
		СтрБП = НовыйБизнесПроцессПоставкиНаСклад.Товары.Добавить();
    	СтрБП.Наименование = СтрТаблТов.Наименование;
    	СтрБП.Количество = СтрТаблТов.Количество;  		
	КонецЦикла;
	
	НовыйБизнесПроцессПоставкиНаСклад.Дата = ТекущаяДата();
	НовыйБизнесПроцессПоставкиНаСклад.Склад=Склад;
	НовыйБизнесПроцессПоставкиНаСклад.СсылкаДокументаПоставки=Ссылка;
	
	НовыйБизнесПроцессПоставкиНаСклад.Записать();
	НовыйБизнесПроцессПоставкиНаСклад.Старт();
	
	СсылкаНаБизнесПроцесс=НовыйБизнесПроцессПоставкиНаСклад.Ссылка;
	// Для сохранения ссылки на БП в документе
	Записать(РежимЗаписиДокумента.Запись);
КонецЕсли;
	
КонецПроцедуры

