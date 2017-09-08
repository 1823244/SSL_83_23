﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Свойство("АвтоТест") Тогда // Возврат при получении формы для анализа.
		Возврат;
	КонецЕсли;
	
	ГлавныйУзел = Константы.ГлавныйУзел.Получить();
	
	Если Не ЗначениеЗаполнено(ГлавныйУзел) Тогда
		ВызватьИсключение НСтр("ru = 'Главный узел не сохранен.'");
	КонецЕсли;
	
	Если ПланыОбмена.ГлавныйУзел() <> Неопределено Тогда
		ВызватьИсключение НСтр("ru = 'Главный узел установлен.'");
	КонецЕсли;
	
	Элементы.ТекстПредупреждения.Заголовок = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
		Элементы.ТекстПредупреждения.Заголовок, Строка(ГлавныйУзел));
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура Восстановить(Команда)
	
	ВосстановитьНаСервере();
	
	Закрыть(Новый Структура("Отказ", Ложь));
	
КонецПроцедуры

&НаКлиенте
Процедура Отключить(Команда)
	
	ОтключитьНаСервере();
	
	Закрыть(Новый Структура("Отказ", Ложь));
	
КонецПроцедуры

&НаКлиенте
Процедура ЗавершитьРаботу(Команда)
	
	Закрыть(Новый Структура("Отказ", Истина));
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервереБезКонтекста
Процедура ОтключитьНаСервере()
	
	НачатьТранзакцию();
	Попытка
		ГлавныйУзел = Константы.ГлавныйУзел.Получить();
		
		ГлавныйУзелМенеджер = Константы.ГлавныйУзел.СоздатьМенеджерЗначения();
		ГлавныйУзелМенеджер.Значение = Неопределено;
		ОбновлениеИнформационнойБазы.ЗаписатьДанные(ГлавныйУзелМенеджер);
		
		ЭтоАвтономноеРабочееМесто = Константы.ЭтоАвтономноеРабочееМесто.СоздатьМенеджерЗначения();
		ЭтоАвтономноеРабочееМесто.Прочитать();
		Если ЭтоАвтономноеРабочееМесто.Значение Тогда
			ЭтоАвтономноеРабочееМесто.Значение = Ложь;
			ОбновлениеИнформационнойБазы.ЗаписатьДанные(ЭтоАвтономноеРабочееМесто);
		КонецЕсли;
		
		Если ОбщегоНазначения.ПодсистемаСуществует("СтандартныеПодсистемы.ОбменДанными") Тогда
			МодульОбменДаннымиСервер = ОбщегоНазначения.ОбщийМодуль("ОбменДаннымиСервер");
			МодульОбменДаннымиСервер.УдалитьНастройкиСинхронизацииСГлавнымУзломРИБ(ГлавныйУзел);
		КонецЕсли;
		
		УстановитьИнициализациюВсехПредопределенныхДанных();
		
		УстановитьОбновлениеПредопределенныхДанныхИнформационнойБазы(
			ОбновлениеПредопределенныхДанных.Авто);
		
		СоздатьНедостающиеПредопределенныеДанные();
		
		ЗафиксироватьТранзакцию();
	Исключение
		ОтменитьТранзакцию();
		ВызватьИсключение;
	КонецПопытки;
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ВосстановитьНаСервере()
	
	ГлавныйУзел = Константы.ГлавныйУзел.Получить();
	
	ПланыОбмена.УстановитьГлавныйУзел(ГлавныйУзел);
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура УстановитьИнициализациюВсехПредопределенныхДанных()
	
	КоллекцииМетаданных = Новый Массив;
	КоллекцииМетаданных.Добавить(Метаданные.Справочники);
	КоллекцииМетаданных.Добавить(Метаданные.ПланыВидовХарактеристик);
	КоллекцииМетаданных.Добавить(Метаданные.ПланыСчетов);
	КоллекцииМетаданных.Добавить(Метаданные.ПланыВидовРасчета);
	
	Для каждого Коллекция Из КоллекцииМетаданных Цикл
		Для Каждого ОбъектМетаданных Из Коллекция Цикл
			Менеджер = ОбщегоНазначения.МенеджерОбъектаПоПолномуИмени(ОбъектМетаданных.ПолноеИмя());
			Менеджер.УстановитьИнициализациюПредопределенныхДанных(Истина);
		КонецЦикла;
	КонецЦикла;
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура СоздатьНедостающиеПредопределенныеДанные()
	
	КоллекцииМетаданных = Новый Массив;
	КоллекцииМетаданных.Добавить(Метаданные.Справочники);
	КоллекцииМетаданных.Добавить(Метаданные.ПланыВидовХарактеристик);
	КоллекцииМетаданных.Добавить(Метаданные.ПланыСчетов);
	КоллекцииМетаданных.Добавить(Метаданные.ПланыВидовРасчета);
	
	Запрос = Новый Запрос;
	ТекстЗапроса =
	"ВЫБРАТЬ
	|	ПсевдонимЗаданнойТаблицы.Ссылка КАК Ссылка,
	|	ЕСТЬNULL(ПсевдонимЗаданнойТаблицы.Родитель.ИмяПредопределенныхДанных, """") КАК ИмяРодителя,
	|	ПсевдонимЗаданнойТаблицы.ИмяПредопределенныхДанных КАК Имя
	|ИЗ
	|	&ТекущаяТаблица КАК ПсевдонимЗаданнойТаблицы
	|ГДЕ
	|	ПсевдонимЗаданнойТаблицы.Предопределенный";
	
	ОписанияСохраненных = Новый Массив;
	Для каждого Коллекция Из КоллекцииМетаданных Цикл
		Для Каждого ОбъектМетаданных Из Коллекция Цикл
			Если ОбъектМетаданных.ОбновлениеПредопределенныхДанных
					= Метаданные.СвойстваОбъектов.ОбновлениеПредопределенныхДанных.НеОбновлятьАвтоматически Тогда
				Продолжить;
			КонецЕсли;
			ПолноеИмя = ОбъектМетаданных.ПолноеИмя();
			Запрос.Текст = СтрЗаменить(ТекстЗапроса, "&ТекущаяТаблица", ПолноеИмя);
			
			Если Коллекция = Метаданные.ПланыСчетов
			 Или Коллекция = Метаданные.ПланыВидовРасчета
			 Или Не ОбъектМетаданных.Иерархический Тогда
				
				Запрос.Текст = СтрЗаменить(Запрос.Текст,
					"ЕСТЬNULL(ПсевдонимЗаданнойТаблицы.Родитель.ИмяПредопределенныхДанных, """")", """""");
			КонецЕсли;
			
			ТаблицаИмен = Запрос.Выполнить().Выгрузить();
			ТаблицаИмен.Индексы.Добавить("Имя");
			Имена = ОбъектМетаданных.ПолучитьИменаПредопределенных();
			СохранитьСуществующиеПредопределенныеОбъектыПередСозданиемНедостающих(
				ОбъектМетаданных, ПолноеИмя, ТаблицаИмен, Имена, Запрос, ОписанияСохраненных);
		КонецЦикла;
	КонецЦикла;
	
	ИнициализироватьПредопределенныеДанные();
	
	// Восстановление предопределенных элементов, существовавших до инициализации.
	Для каждого ОписаниеСохраненных Из ОписанияСохраненных Цикл
		Запрос.Текст = ОписаниеСохраненных.ТекстЗапроса;
		ТаблицаИмен = Запрос.Выполнить().Выгрузить();
		ТаблицаИмен.Индексы.Добавить("Имя");
		Для каждого ОписаниеСохраненного Из ОписаниеСохраненных.ТаблицаИмен Цикл
			Если Не ОписаниеСохраненного.ОбъектСуществует Тогда
				Продолжить;
			КонецЕсли;
			Строка = ТаблицаИмен.Найти(ОписаниеСохраненного.Имя, "Имя");
			Если Строка <> Неопределено Тогда
				ОбновлениеИнформационнойБазы.УдалитьДанные(Строка.Ссылка.ПолучитьОбъект());
				Строка.Имя = "";
			КонецЕсли;
			ОбновлениеИнформационнойБазы.ЗаписатьДанные(ОписаниеСохраненного.Объект);
		КонецЦикла;
		Для каждого Строка Из ТаблицаИмен Цикл
			Если Не ЗначениеЗаполнено(Строка.Имя)
			 Или Не ЗначениеЗаполнено(Строка.ИмяРодителя) Тогда
				Продолжить;
			КонецЕсли;
			СтрокаРодителя = ОписаниеСохраненных.ТаблицаИмен.Найти(Строка.ИмяРодителя, "Имя");
			Если СтрокаРодителя <> Неопределено Тогда
				НовыйОбъект = Строка.Ссылка.ПолучитьОбъект();
				НовыйОбъект.Родитель = СтрокаРодителя.Ссылка;
				ОбновлениеИнформационнойБазы.ЗаписатьДанные(НовыйОбъект);
			КонецЕсли;
		КонецЦикла;
	КонецЦикла;
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура СохранитьСуществующиеПредопределенныеОбъектыПередСозданиемНедостающих(
		ОбъектМетаданных, ПолноеИмя, ТаблицаИмен, Имена, Запрос, ОписанияСохраненных)
	
	ТребуетсяИнициализация = Ложь;
	ПредопределенныеСуществуют = Ложь;
	ТаблицаИмен.Колонки.Добавить("ОбъектСуществует", Новый ОписаниеТипов("Булево"));
	
	Для каждого Имя Из Имена Цикл
		Строки = ТаблицаИмен.НайтиСтроки(Новый Структура("Имя", Имя));
		Если Строки.Количество() = 0 Тогда
			ТребуетсяИнициализация = Истина;
		Иначе
			Для Каждого Строка Из Строки Цикл
				Строка.ОбъектСуществует = Истина;
			КонецЦикла;
			ПредопределенныеСуществуют = Истина;
		КонецЕсли;
	КонецЦикла;
	
	Если Не ТребуетсяИнициализация Тогда
		Возврат;
	КонецЕсли;
	
	Если ПредопределенныеСуществуют Тогда
		ОписаниеСохраненных = Новый Структура;
		ОписаниеСохраненных.Вставить("ТекстЗапроса", Запрос.Текст);
		ОписаниеСохраненных.Вставить("ТаблицаИмен", ТаблицаИмен);
		ОписанияСохраненных.Добавить(ОписаниеСохраненных);
		
		ТаблицаИмен.Колонки.Добавить("Объект");
		Для каждого Строка Из ТаблицаИмен Цикл
			Если Строка.ОбъектСуществует Тогда
				Объект = Строка.Ссылка.ПолучитьОбъект();
				Объект.ИмяПредопределенныхДанных = "";
				ОбновлениеИнформационнойБазы.ЗаписатьДанные(Объект);
				Объект.ИмяПредопределенныхДанных = Строка.Имя;
				Строка.Объект = Объект;
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
	
	Менеджер = ОбщегоНазначения.МенеджерОбъектаПоПолномуИмени(ПолноеИмя);
	Менеджер.УстановитьИнициализациюПредопределенныхДанных(Ложь);
	
КонецПроцедуры

#КонецОбласти
