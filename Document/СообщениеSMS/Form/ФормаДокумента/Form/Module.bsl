﻿
#Область ОписаниеПеременных

&НаКлиенте
Перем КонтекстВыбора;

#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)

	УстановитьУсловноеОформление();
	
	// Пропускаем инициализацию, чтобы гарантировать получение формы при передаче параметра "АвтоТест".
	Если Параметры.Свойство("АвтоТест") Тогда
		Возврат;
	КонецЕсли;
	
	Если Объект.Ссылка.Пустая() Тогда
		Объект.Состояние = Перечисления.СостоянияДокументаСообщениеSMS.Черновик;
		Рассмотрено = Истина;
		ПриСозданииЧтенииНаСервере();
		Взаимодействия.УстановитьПредметПоДаннымЗаполнения(Параметры, Предмет);
		ИзменилисьКонтакты = Истина;
	КонецЕсли;
	
	Если НЕ ИнформационнаяБазаФайловая Тогда
		Элементы.АдресатыПроверитьСтатусыДоставки.Видимость = Ложь;
	КонецЕсли;
	
	Взаимодействия.ЗаполнитьСписокВыбораДляРассмотретьПосле(Элементы.РассмотретьПосле.СписокВыбора);
	
	// Определим типы контактов, которые можно создать.
	СписокИнтерактивноСоздаваемыхКонтактов = Взаимодействия.СоздатьСписокЗначенийИнтерактивноСоздаваемыхКонтактов();
	Элементы.СоздатьКонтакт.Видимость      = СписокИнтерактивноСоздаваемыхКонтактов.Количество() > 0;
	
	// Подготовить оповещения взаимодействий.
	Взаимодействия.ПодготовитьОповещения(ЭтотОбъект, Параметры);
	
	// СтандартныеПодсистемы.ДополнительныеОтчетыИОбработки
	Если ОбщегоНазначения.ПодсистемаСуществует("СтандартныеПодсистемы.ДополнительныеОтчетыИОбработки") Тогда
		МодульДополнительныеОтчетыИОбработки = ОбщегоНазначения.ОбщийМодуль("ДополнительныеОтчетыИОбработки");
		МодульДополнительныеОтчетыИОбработки.ПриСозданииНаСервере(ЭтотОбъект);
	КонецЕсли;
	
	// Конец СтандартныеПодсистемы.ДополнительныеОтчетыИОбработки
	
	// СтандартныеПодсистемы.Свойства
	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("ИмяЭлементаДляРазмещения", "СтраницаДополнительныеРеквизиты");
	ДополнительныеПараметры.Вставить("ОтложеннаяИнициализация", Истина);
	УправлениеСвойствами.ПриСозданииНаСервере(ЭтотОбъект, ДополнительныеПараметры);
	// Конец СтандартныеПодсистемы.Свойства
	
КонецПроцедуры

&НаСервере
Процедура ПриЗаписиНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	Взаимодействия.ПриЗаписиВзаимодействияИзФормы(ТекущийОбъект, ЭтотОбъект);
	
КонецПроцедуры

&НаСервере
Процедура ПослеЗаписиНаСервере(ТекущийОбъект, ПараметрыЗаписи)
	
	Элементы.СтраницаКомментарий.Картинка = ОбщегоНазначенияКлиентСервер.КартинкаКомментария(Объект.Комментарий);

КонецПроцедуры 

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
	Взаимодействия.УстановитьРеквизитыФормыВзаимодействияПоДаннымРегистра(ЭтотОбъект);
	
	// СтандартныеПодсистемы.Свойства
	УправлениеСвойствами.ПриЧтенииНаСервере(ЭтотОбъект, ТекущийОбъект);
	// Конец СтандартныеПодсистемы.Свойства
	
	ПриСозданииЧтенииНаСервере();
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	// СтандартныеПодсистемы.Свойства
	УправлениеСвойствамиКлиент.ПослеЗагрузкиДополнительныхРеквизитов(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.Свойства
	
	ПроверитьДоступностьСозданияКонтакта();
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)

	// СтандартныеПодсистемы.Свойства
	Если УправлениеСвойствамиКлиент.ОбрабатыватьОповещения(ЭтотОбъект, ИмяСобытия, Параметр) Тогда
		ОбновитьЭлементыДополнительныхРеквизитов();
		УправлениеСвойствамиКлиент.ПослеЗагрузкиДополнительныхРеквизитов(ЭтотОбъект);
	КонецЕсли;
	// Конец СтандартныеПодсистемы.Свойства
	
	ВзаимодействияКлиент.ОтработатьОповещение(ЭтотОбъект, ИмяСобытия, Параметр, Источник);
	ВзаимодействияКлиентСервер.ПроверитьЗаполнениеКонтактов(Объект, ЭтотОбъект, "СообщениеSMS");
	ПроверитьДоступностьСозданияКонтакта();
	КоличествоАдресатов = Объект.Адресаты.Количество();
	
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, РежимЗаписи)
	
	// СтандартныеПодсистемы.Свойства
	УправлениеСвойствами.ПередЗаписьюНаСервере(ЭтотОбъект, ТекущийОбъект);
	// Конец СтандартныеПодсистемы.Свойства
	
	Взаимодействия.ПередЗаписьюВзаимодействияИзФормы(ЭтотОбъект, ТекущийОбъект, ИзменилисьКонтакты);
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)

	ВзаимодействияКлиент.ВзаимодействиеПредметПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи, "СообщениеSMS");
	ПроверитьДоступностьСозданияКонтакта();
	
КонецПроцедуры

&НаСервере
Процедура ОбработкаПроверкиЗаполненияНаСервере(Отказ, ПроверяемыеРеквизиты)
	
	// СтандартныеПодсистемы.Свойства
	УправлениеСвойствами.ОбработкаПроверкиЗаполнения(ЭтотОбъект, Отказ, ПроверяемыеРеквизиты);
	// Конец СтандартныеПодсистемы.Свойства
	
	ПроверитьЗаполнениеСпискаАдресатов(Отказ);
	
КонецПроцедуры

&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	
	Если Объект.Состояние = ПредопределенноеЗначение("Перечисление.СостоянияДокументаСообщениеSMS.Черновик")
		ИЛИ Объект.Состояние = ПредопределенноеЗначение("Перечисление.СостоянияДокументаСообщениеSMS.Исходящее") Тогда
		ВзаимодействияКлиент.ПроверкаЗаполненностиРеквизитовОтложеннойОтправки(Объект, Отказ);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаВыбора(ВыбранноеЗначение, ИсточникВыбора)
	
	ВзаимодействияКлиент.ФормаОбработкаВыбора(ЭтотОбъект, ВыбранноеЗначение, ИсточникВыбора, КонтекстВыбора);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура СтраницыКонтактыДопРеквизитыКомментарийПриСменеСтраницы(Элемент, ТекущаяСтраница)
	
	// СтандартныеПодсистемы.Свойства
	Если ТекущаяСтраница.Имя = "СтраницаДополнительныеРеквизиты"
		И Не ЭтотОбъект.ПараметрыСвойств.ВыполненаОтложеннаяИнициализация Тогда
		
		СвойстваВыполнитьОтложеннуюИнициализацию();
		УправлениеСвойствамиКлиент.ПослеЗагрузкиДополнительныхРеквизитов(ЭтотОбъект);
	КонецЕсли;
	// Конец СтандартныеПодсистемы.Свойства
	
КонецПроцедуры

&НаКлиенте
Процедура РассмотретьПослеОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	
	ВзаимодействияКлиент.ОбработатьВыборВПолеРассмотретьПосле(
		РассмотретьПосле, ВыбранноеЗначение, СтандартнаяОбработка, Модифицированность);
	
КонецПроцедуры

&НаКлиенте
Процедура НаКонтролеПриИзменении()
	
	Рассмотрено = НЕ НаКонтроле;
	УправлениеДоступностью(ЭтотОбъект);
	Модифицированность = Истина;
	
КонецПроцедуры

&НаКлиенте
Процедура ТекстСообщенияОкончаниеВводаТекста(Элемент, Текст, ДанныеВыбора, СтандартнаяОбработка)
	
	ОсталосьСимволов      = ВзаимодействияКлиентСервер.СформироватьИнформационнуюНадписьКоличествоСимволовСообщений(
	                          Объект.ОтправлятьВТранслите,
	                          Текст);
	Объект.ТекстСообщения = Текст;
	
КонецПроцедуры

&НаКлиенте
Процедура ОтправлятьВТранслитеПриИзменении(Элемент)
	
	ОсталосьСимволов = ВзаимодействияКлиентСервер.СформироватьИнформационнуюНадписьКоличествоСимволовСообщений(
	                        Объект.ОтправлятьВТранслите,
	                        Объект.ТекстСообщения)
	
КонецПроцедуры

&НаКлиенте
Процедура ПредметНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	ВзаимодействияКлиент.ПредметНачалоВыбора(ЭтотОбъект, Элемент, ДанныеВыбора, СтандартнаяОбработка);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыАдресаты

&НаКлиенте
Процедура АдресатыПриИзменении(Элемент)
	
	ВзаимодействияКлиентСервер.ПроверитьЗаполнениеКонтактов(Объект, ЭтотОбъект, "СообщениеSMS");
	КоличествоАдресатов = Объект.Адресаты.Количество();
	ИзменилисьКонтакты = Истина;
	
КонецПроцедуры

&НаКлиенте
Процедура АдресатыПриАктивизацииСтроки(Элемент)
	
	ПроверитьДоступностьСозданияКонтакта();
	
КонецПроцедуры

&НаКлиенте
Процедура КонтактНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	текДанные = Элементы.Адресаты.ТекущиеДанные;
	
	ПараметрыОткрытия = Новый Структура;
	ПараметрыОткрытия.Вставить("ТолькоEmail",                       Ложь);
	ПараметрыОткрытия.Вставить("ТолькоТелефон",                     Истина);
	ПараметрыОткрытия.Вставить("ЗаменятьПустыеАдресИПредставление", Истина);
	ПараметрыОткрытия.Вставить("ДляФормыУточненияКонтактов",        Ложь);
	ПараметрыОткрытия.Вставить("ИдентификаторФормы",                УникальныйИдентификатор);
	
	ВзаимодействияКлиент.ВыбратьКонтакт(Предмет, текДанные.КакСвязаться, текДанные.ПредставлениеКонтакта,
	                                    текДанные.Контакт, ПараметрыОткрытия); 
	
КонецПроцедуры

&НаКлиенте
Процедура ПредставлениеКонтактаПриИзменении(Элемент)
	
	ПроверитьДоступностьСозданияКонтакта();
	
КонецПроцедуры

&НаКлиенте
Процедура КонтактПриИзменении(Элемент)
	
	ПроверитьДоступностьСозданияКонтакта();
	ВзаимодействияКлиентСервер.ПроверитьЗаполнениеКонтактов(Объект, ЭтотОбъект, "СообщениеSMS");
	
КонецПроцедуры

&НаКлиенте
Процедура АдресатыПриОкончанииРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования)
	
	ТекущиеДанные = Элементы.Адресаты.ТекущиеДанные;
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Если НЕ ЗначениеЗаполнено(ТекущиеДанные.СостояниеСообщения) Тогда
		ТекущиеДанные.СостояниеСообщения = ПредопределенноеЗначение("Перечисление.СостоянияСообщенияSMS.Черновик");
	КонецЕсли;
	
КонецПроцедуры 

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура СоздатьКонтактВыполнить()
	
	текДанные = Элементы.Адресаты.ТекущиеДанные;
	Если текДанные <> Неопределено Тогда
		ВзаимодействияКлиент.СоздатьКонтакт(
			текДанные.ПредставлениеКонтакта, текДанные.КакСвязаться, Объект.Ссылка, СписокИнтерактивноСоздаваемыхКонтактов);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура Отправить(Команда)
	
	ОчиститьСообщения();
	
	Если ПроверитьЗаполнение() Тогда
		ОтправитьВыполнить();
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПроверитьСтатусыДоставки(Команда)
	
	ОчиститьСообщения();
	ПроверитьСтатусыДоставкиСервер();
	
КонецПроцедуры

// СтандартныеПодсистемы.Свойства

&НаКлиенте
Процедура Подключаемый_РедактироватьСоставСвойств()
	
	УправлениеСвойствамиКлиент.РедактироватьСоставСвойств(ЭтотОбъект, Объект.Ссылка);
	
КонецПроцедуры

// Конец СтандартныеПодсистемы.Свойства

// СтандартныеПодсистемы.ДополнительныеОтчетыИОбработки
&НаКлиенте
Процедура Подключаемый_ВыполнитьНазначаемуюКоманду(Команда)
	
	Если ОбщегоНазначенияКлиент.ПодсистемаСуществует("ДополнительныеОтчетыИОбработки") Тогда
		
		МодульДополнительныеОтчетыИОбработкиКлиент = ОбщегоНазначенияКлиент.ОбщийМодуль("ДополнительныеОтчетыИОбработкиКлиент");
		Если НЕ МодульДополнительныеОтчетыИОбработкиКлиент.ВыполнитьНазначаемуюКомандуНаКлиенте(ЭтотОбъект, Команда.Имя) Тогда
			ДополнительныеОтчетыИОбработкиВыполнитьНазначаемуюКомандуНаСервере(Команда.Имя);
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры
// Конец СтандартныеПодсистемы.ДополнительныеОтчетыИОбработки 

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура УстановитьУсловноеОформление()

	УсловноеОформление.Элементы.Очистить();

КонецПроцедуры

// СтандартныеПодсистемы.Свойства

&НаСервере
Процедура СвойстваВыполнитьОтложеннуюИнициализацию()
	УправлениеСвойствами.ЗаполнитьДополнительныеРеквизитыВФорме(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьЗависимостиДополнительныхРеквизитов()
	УправлениеСвойствамиКлиент.ОбновитьЗависимостиДополнительныхРеквизитов(ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПриИзмененииДополнительногоРеквизита(Элемент)
	УправлениеСвойствамиКлиент.ОбновитьЗависимостиДополнительныхРеквизитов(ЭтотОбъект);
КонецПроцедуры

&НаСервере
Процедура ОбновитьЭлементыДополнительныхРеквизитов()
	
	УправлениеСвойствами.ОбновитьЭлементыДополнительныхРеквизитов(ЭтотОбъект);
	
КонецПроцедуры

// Конец СтандартныеПодсистемы.Свойства

// СтандартныеПодсистемы.ДополнительныеОтчетыИОбработки

&НаСервере
Процедура ДополнительныеОтчетыИОбработкиВыполнитьНазначаемуюКомандуНаСервере(ИмяЭлемента)
	
	Если ОбщегоНазначения.ПодсистемаСуществует("СтандартныеПодсистемы.ДополнительныеОтчетыИОбработки") Тогда
		МодульДополнительныеОтчетыИОбработки = ОбщегоНазначения.ОбщийМодуль("ДополнительныеОтчетыИОбработки");
		МодульДополнительныеОтчетыИОбработки.ВыполнитьНазначаемуюКомандуНаСервере(ЭтотОбъект, ИмяЭлемента);
	КонецЕсли;
	
КонецПроцедуры

// Конец СтандартныеПодсистемы.ДополнительныеОтчетыИОбработки


///////////////////////////////////////////////////////////////////////////////
// Прочее

&НаКлиенте
Процедура ПроверитьДоступностьСозданияКонтакта()
	
	ТекДанные = Элементы.Адресаты.ТекущиеДанные;
	Элементы.СоздатьКонтакт.Доступность = (Не Объект.Ссылка.Пустая())
	                                       И ((ТекДанные <> Неопределено) 
	                                       И (НЕ ЗначениеЗаполнено(ТекДанные.Контакт)));
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииЧтенииНаСервере()
	
	ИнформационнаяБазаФайловая = ОбщегоНазначения.ИнформационнаяБазаФайловая();
	ОбработатьПереданныеПараметры(Параметры);
	ВзаимодействияКлиентСервер.ПроверитьЗаполнениеКонтактов(Объект, ЭтотОбъект, "СообщениеSMS");
	Элементы.РассмотретьПосле.Доступность = НЕ Рассмотрено;
	ОсталосьСимволов = ВзаимодействияКлиентСервер.СформироватьИнформационнуюНадписьКоличествоСимволовСообщений(
	                     Объект.ОтправлятьВТранслите,
	                     Объект.ТекстСообщения);
	Элементы.СтраницаКомментарий.Картинка = ОбщегоНазначенияКлиентСервер.КартинкаКомментария(Объект.Комментарий);
	НаКонтроле = НЕ Рассмотрено;
	УправлениеДоступностью(ЭтотОбъект);
	КоличествоАдресатов = Объект.Адресаты.Количество();
	
КонецПроцедуры

&НаКлиенте
Процедура ОтправитьВыполнить()
	
	ОчиститьСообщения();
	
	Если ИнформационнаяБазаФайловая 
		И (Объект.ДатаКогдаОтправить = Дата(1,1,1) ИЛИ Объект.ДатаКогдаОтправить < ОбщегоНазначенияКлиент.ДатаСеанса())
		И (Объект.ДатаАктуальностиОтправки = Дата(1,1,1) ИЛИ Объект.ДатаАктуальностиОтправки > ОбщегоНазначенияКлиент.ДатаСеанса()) Тогда
			КоличествоОтправленных = ВыполнитьОтправкуНаСервере();
			Если НЕ КоличествоОтправленных > 0 Тогда
				Возврат;
			КонецЕсли;
	Иначе
		ВзаимодействияКлиентСервер.УстановитьСостояниеИсходящееДокументСообщениеSMS(Объект);
	КонецЕсли;
	
	Записать();
	Закрыть();

КонецПроцедуры

&НаСервере
Процедура ПроверитьЗаполнениеСпискаАдресатов(Отказ)

	Для Каждого Адресат Из Объект.Адресаты Цикл
		ПроверитьЗаполнениеТелефона(Адресат, Отказ);
	КонецЦикла;
	
КонецПроцедуры

&НаСервере
Процедура ПроверитьЗаполнениеТелефона(Адресат, Отказ)
	
	Если ПустаяСтрока(Адресат.КакСвязаться) Тогда
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
			НСтр("ru = 'Поле ""Номер телефона"" не заполнено.'"),
			,
			ОбщегоНазначенияКлиентСервер.ПутьКТабличнойЧасти("Объект.Адресаты", Адресат.НомерСтроки, "КакСвязаться"),
			,
			Отказ);
			Возврат;
	КонецЕсли;
		
	Если СтрРазделить(Адресат.КакСвязаться, ";", Ложь).Количество() > 1 Тогда
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
			НСтр("ru = 'Должен быть указан только один номер телефона'"),
			,
			ОбщегоНазначенияКлиентСервер.ПутьКТабличнойЧасти("Объект.Адресаты", Адресат.НомерСтроки, "КакСвязаться"),
			,
			Отказ);
			Возврат;
	КонецЕсли;
		
	СтруктураПолей = ВзаимодействияКлиентСервер.СтруктураПолейПоПредставлениюТелефона(Адресат.КакСвязаться);
	Если Не ВзаимодействияКлиентСервер.КорректноВведенНомерТелефона(СтруктураПолей) Тогда
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
			НСтр("ru = 'Номер телефона должен быть указан в формате ""+xx (xxx) xxxxxxx"".'"),
			,
			ОбщегоНазначенияКлиентСервер.ПутьКТабличнойЧасти("Объект.Адресаты", Адресат.НомерСтроки, "КакСвязаться"),
			,
			Отказ);
			Возврат;
	Иначе
		Адресат.НомерДляОтправки = ?(ЛЕВ(СтруктураПолей.КодСтраны,1)= "+",
		                             СтруктураПолей.КодСтраны,
		                             "+" + СтруктураПолей.КодСтраны) + СтруктураПолей.КодГорода + СтруктураПолей.НомерТелефона;
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Функция ВыполнитьОтправкуНаСервере()
	
	Возврат Взаимодействия.ОтправкаSMSПоДокументу(Объект);
	
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Процедура УправлениеДоступностью(Форма)

	СообщениеОтправлено = СообщениеОтправлено(Форма.Объект.Состояние);
	
	ОтправкаДоступна = Истина;
	Если Форма.ИнформационнаяБазаФайловая Тогда
		Если СообщениеОтправлено Тогда
			ОтправкаДоступна = Ложь;
		ИначеЕсли Форма.Объект.Состояние = ПредопределенноеЗначение("Перечисление.СостоянияДокументаСообщениеSMS.Исходящее") Тогда
			#Если Клиент Тогда
				ДатаСеанса = ОбщегоНазначенияКлиент.ДатаСеанса();
			#Иначе
				ДатаСеанса = ТекущаяДатаСеанса();
			#КонецЕсли
			Если (Форма.Объект.ДатаКогдаОтправить) <> Дата(1,1,1)
				И Форма.Объект.ДатаКогдаОтправить > ДатаСеанса Тогда
				ОтправкаДоступна = Ложь;
			КонецЕсли;
			Если (Форма.Объект.ДатаАктуальностиОтправки) <> Дата(1,1,1)
				И Форма.Объект.ДатаАктуальностиОтправки < ДатаСеанса Тогда
				ОтправкаДоступна = Ложь;
			КонецЕсли;
		КонецЕсли;
	Иначе
		Если Форма.Объект.Состояние <> ПредопределенноеЗначение("Перечисление.СостоянияДокументаСообщениеSMS.Черновик") Тогда
			ОтправкаДоступна = Ложь;
		КонецЕсли
	КонецЕсли;
	
	Форма.Элементы.ФормаОтправить.Доступность                 = ОтправкаДоступна;
	Форма.Элементы.Адресаты.ТолькоПросмотр                    = СообщениеОтправлено;
	Форма.Элементы.ОтправлятьВТранслите.Доступность           = НЕ СообщениеОтправлено;
	Форма.Элементы.ТекстСообщения.ТолькоПросмотр              = СообщениеОтправлено;
	Форма.Элементы.РассмотретьПосле.Доступность               = Форма.НаКонтроле;
	Форма.Элементы.ГруппаДатаОтправкиАктуальность.Доступность = НЕ СообщениеОтправлено;
	
	Форма.Элементы.АдресатыПроверитьСтатусыДоставки.Доступность =
	                 Форма.ИнформационнаяБазаФайловая
	                 И СообщениеОтправлено
	                 И Форма.Объект.Состояние = ПредопределенноеЗначение("Перечисление.СостоянияДокументаСообщениеSMS.Доставляется");

КонецПроцедуры

&НаСервере
Процедура ПроверитьСтатусыДоставкиСервер()

	УстановитьПривилегированныйРежим(Истина);
	Если Не ОтправкаSMS.НастройкаОтправкиSMSВыполнена() Тогда
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(НСтр("ru = 'Не выполнены настройки отправки SMS.'"),,"Объект");
		Возврат;
	КонецЕсли;
	
	Взаимодействия.ПроверитьСтатусыДоставкиSMS(Объект, Модифицированность);
	УправлениеДоступностью(ЭтотОбъект);

КонецПроцедуры

&НаСервере
Процедура ОбработатьПереданныеПараметры(ПереданныеПараметры)
	
	Если Объект.Ссылка.Пустая() Тогда
		
		Если ПереданныеПараметры.Свойство("Текст") И НЕ ПустаяСтрока(ПереданныеПараметры.Текст) Тогда
			
			Объект.ТекстСообщения = ПереданныеПараметры.Текст;
			
		КонецЕсли;
		
		Если ПереданныеПараметры.Адресаты <> Неопределено Тогда
			
			Если ТипЗнч(ПереданныеПараметры.Адресаты) = Тип("Строка") И НЕ ПустаяСтрока(ПереданныеПараметры.Адресаты) Тогда
				
				НоваяСтрока = Объект.Адресаты.Добавить();
				НоваяСтрока.Адрес = ПереданныеПараметры.Кому;
				
			ИначеЕсли ТипЗнч(ПереданныеПараметры.Адресаты) = Тип("СписокЗначений") Тогда
				
				Для Каждого ЭлементСписка Из ПереданныеПараметры.Адресаты Цикл
					НоваяСтрока = Объект.Адресаты.Добавить();
					НоваяСтрока.КакСвязаться  = ЭлементСписка.Значение;
					НоваяСтрока.Представление = ЭлементСписка.Представление;
				КонецЦикла;
				
			ИначеЕсли ТипЗнч(ПереданныеПараметры.Адресаты) = Тип("Массив") Тогда
				
				Для Каждого ЭлементМассива Из ПереданныеПараметры.Адресаты Цикл
					
					НоваяСтрока = Объект.Адресаты.Добавить();
					НоваяСтрока.КакСвязаться          = ЭлементМассива.Телефон;
					НоваяСтрока.ПредставлениеКонтакта = ЭлементМассива.Представление;
					НоваяСтрока.Контакт               = ЭлементМассива.ИсточникКонтактнойИнформации;
					
				КонецЦикла;
				
			КонецЕсли;
			
		КонецЕсли;
		
		Если ПереданныеПараметры.Свойство("Предмет") Тогда
			Предмет = ПереданныеПараметры.Предмет;
		КонецЕсли;
		
		Если ПереданныеПараметры.Свойство("ОтправлятьВТранслите") Тогда
			Объект.ОтправлятьВТранслите = ПереданныеПараметры.ОтправлятьВТранслите;
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Функция СообщениеОтправлено(Состояние)
	
	Возврат Состояние <> ПредопределенноеЗначение("Перечисление.СостоянияДокументаСообщениеSMS.Черновик")
	        И Состояние <> ПредопределенноеЗначение("Перечисление.СостоянияДокументаСообщениеSMS.Исходящее");
	
КонецФункции;

#КонецОбласти
