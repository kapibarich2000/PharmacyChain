﻿Процедура УстановкаПараметровСеанса(ТребуемыеПараметры)
	ИмяПольз = ИмяПользователя();
  	ТекПользователь = Справочники.Сотрудники.НайтиПоНаименованию(ИмяПольз, Истина);	
	
	// Для автоматического создания новых ползователей в справочнике:
	
	//Если Не ЗначениеЗаполнено(ТекПользователь) Тогда
	//    	НовыйПользователь = Справочники.Сотрудники.СоздатьЭлемент();
	//    	НовыйПользователь.Наименование = ИмяПольз;
	//    	НовыйПользователь.Код = ИмяПольз;
	//    	НовыйПользователь.Записать();
	//    	ТекПользователь = НовыйПользователь.Ссылка;
	//  КонецЕсли;    
	
	ПараметрыСеанса.ТекущийПользователь=ТекПользователь;
	Сообщить("С возвращением, "+ТекПользователь);
	
КонецПроцедуры
