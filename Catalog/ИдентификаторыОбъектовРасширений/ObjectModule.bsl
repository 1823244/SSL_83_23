﻿#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий

Процедура ПередЗаписью(Отказ)
	
	Справочники.ИдентификаторыОбъектовМетаданных.ПередЗаписьюОбъекта(ЭтотОбъект);
	
КонецПроцедуры

Процедура ПередУдалением(Отказ)
	
	Справочники.ИдентификаторыОбъектовМетаданных.ПередУдалениемОбъекта(ЭтотОбъект);
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли
