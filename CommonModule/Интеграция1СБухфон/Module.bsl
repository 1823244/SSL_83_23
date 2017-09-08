﻿////////////////////////////////////////////////////////////////////////////////
// Подсистема "Интеграция с 1С:Бухфон".
//
////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Процедура устанавливает свойства элемента кнопки при встраивании в другие подсистемы.
//
Процедура ПриСозданииНаСервере(Элемент) Экспорт
	
	НастройкиПользователя = Интеграция1СБухфонВызовСервера.НастройкиУчетнойЗаписиПользователя();
	Элемент.Видимость = НастройкиПользователя.ВидимостьКнопки1СБухфон;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// См. описание этой же процедуры в модуле СтандартныеПодсистемыСервер.
//
Процедура ПриДобавленииОбработчиковСлужебныхСобытий(КлиентскиеОбработчики, СерверныеОбработчики) Экспорт
	
	// СЕРВЕРНЫЕ ОБРАБОТЧИКИ.
	СерверныеОбработчики["СтандартныеПодсистемы.ОбновлениеВерсииИБ\ПриДобавленииОбработчиковОбновления"].Добавить(
		"Интеграция1СБухфон");
	
КонецПроцедуры

// Добавляет процедуры-обработчики обновления, необходимые данной подсистеме.
//
// Параметры:
//  Обработчики - ТаблицаЗначений - см. описание функции НоваяТаблицаОбработчиковОбновления
//                                  общего модуля ОбновлениеИнформационнойБазы.
//
Процедура ПриДобавленииОбработчиковОбновления(Обработчики) Экспорт
	
	Обработчик = Обработчики.Добавить();
	Обработчик.НачальноеЗаполнение = Истина;
	Обработчик.Процедура = "Интеграция1СБухфон.ПервоначальноеЗаполнение";		
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Записывает в регистр сведений путь исполняемого файла 1С-Бухфон. 
// Хранение путей до исполняемых файлов ведется в разрезе ПК, для определения ПК используется идентификатор клиента
// т.к. невозможно использование функции ИмяКомпьютера в веб клиенте.
//
// Параметры:
//		ИдентификаторКлиента	- УникальныйИдентификатор - Идентификатор клиента (программы) 1С.
//		НовоеРасположениеФайла 	- Строка - Расположение исполняемого файла для ПК на котором запущен клиент 1С.
Процедура СохранитьРасположениеИсполняемогоФайла1СБухфон(ИдентификаторКлиента, НовоеРасположениеФайла) Экспорт 
	
	ТекущееРасположениеФайла = Интеграция1СБухфонВызовСервера.РасположениеИсполняемогоФайла(ИдентификаторКлиента);

	Если ТекущееРасположениеФайла = НовоеРасположениеФайла Тогда
		Возврат;	
	КонецЕсли;

	ХранилищеОбщихНастроек.Сохранить("ПутиИсполняемыхФайлов1СБухфон", ИдентификаторКлиента, НовоеРасположениеФайла);
	
КонецПроцедуры

// Записывает в регистр сведений настройки учетных записей пользователей для запуска приложения.
//
// Параметры:
// 		Пользователь            - УникальныйИдентификатор - Текущий пользователь информационной базы.
// 		Логин					- Строка - Данные учетной записи приложения.
// 		Пароль		    		- Строка - Данные учетной записи приложения.
//		ИспользоватьЛП  		- Булево - Если значение Ложь, параметры Логин, Пароль не доступны.
//		ВидимостьКнопки1СБухфон - Булево - Отображение Кнопки запуска приложения на начальной странице.
//
Процедура СохранитьНастройкиПользователяВХранилище(Логин, 
										 Пароль, 
										 ИспользоватьЛП, 
										 ВидимостьКнопки1СБухфон) Экспорт
		
	НастройкиПользователя = НастройкиПользователя();
	НастройкиПользователя.Логин 					= Логин;
	НастройкиПользователя.Пароль 					= Пароль;
	НастройкиПользователя.ИспользоватьЛП 			= ИспользоватьЛП;
	НастройкиПользователя.ВидимостьКнопки1СБухфон 	= ВидимостьКнопки1СБухфон;		
	
	ХранилищеОбщихНастроек.Сохранить("УчетныеЗаписиПользователей1СБухфон", "НастройкиУчетныхДанных", НастройкиПользователя);
	
КонецПроцедуры

Функция НастройкиПользователя() Экспорт
	
	НастройкиПользователя = Новый Структура();
	НастройкиПользователя.Вставить("Логин", "");
	НастройкиПользователя.Вставить("Пароль","");
	НастройкиПользователя.Вставить("ИспользоватьЛП",Ложь);
	НастройкиПользователя.Вставить("ВидимостьКнопки1СБухфон",Ложь);	
	
	Возврат НастройкиПользователя;
	
КонецФункции

Процедура ПервоначальноеЗаполнение() Экспорт
	Константы.ИспользоватьИнтеграцию1СБухфон.Установить(Истина);	
КонецПроцедуры
	
#КонецОбласти



