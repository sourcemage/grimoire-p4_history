/************************
 This code is released under the terms of the GNU GPL, v2 (or any later version).
 The GNU GPL can be found in the file 'COPYING'.  Copyright Geoffrey French 1999-2001.
 ************************/
#ifndef __VECTORWIDGET_CPP
#define __VECTORWIDGET_CPP

#include <stdio.h>

#include <strstream>

using namespace std;

#include <gtk/gtkmarshal.h>

#include <gtk/gtkentry.h>
#include <gtk/gtkvbox.h>
#include <gtk/gtksignal.h>

#include "VectorWidget.h"



/*
*******************************************************************************
											VectorWidget
*******************************************************************************
*/

VectorWidget::VectorWidget(int s, const Vector3& v)
{
	val = v;
	size = s;
	disconnect();
	constructorShared();
}

VectorWidget::VectorWidget(GtkSignalFunc f, gpointer d,
									int s, const Vector3& v)
{
	val = v;
	size = s;
	disconnect();			//when the text entry widgets are built, a "changed"
								//signal gets emitted. make sure no one receives this!
	constructorShared();
	connect(f, d);
}


VectorWidget::~VectorWidget()
{
	gtk_widget_unref(xentry);
	gtk_widget_unref(yentry);
	gtk_widget_unref(zentry);
	gtk_widget_unref(box);
}


void VectorWidget::constructorShared()
{
	blockChangedEvent = true;

	xentry = gtk_entry_new();
	yentry = gtk_entry_new();
	zentry = gtk_entry_new();
	box = gtk_vbox_new(false, 0);

	gtk_widget_ref(xentry);
	gtk_widget_ref(yentry);
	gtk_widget_ref(zentry);
	gtk_widget_ref(box);
	
	gtk_box_pack_start(GTK_BOX(box), xentry, false, true, 0);
	if (size >= 2)
	{
		gtk_box_pack_start(GTK_BOX(box), yentry, false, true, 0);
	}
	if (size >= 3)
	{
		gtk_box_pack_start(GTK_BOX(box), zentry, false, true, 0);
	}
	gtk_signal_connect(GTK_OBJECT(xentry), "activate",
							 GTK_SIGNAL_FUNC(x_changed), this);
	gtk_signal_connect(GTK_OBJECT(yentry), "activate",
							 GTK_SIGNAL_FUNC(y_changed), this);
	gtk_signal_connect(GTK_OBJECT(zentry), "activate",
							 GTK_SIGNAL_FUNC(z_changed), this);
	gtk_widget_show(xentry);
	if (size >= 2)
	{
		gtk_widget_show(yentry);
	}
	if (size >= 3)
	{
		gtk_widget_show(zentry);
	}


	update();

	blockChangedEvent = false;
}


void VectorWidget::emitSignal()
{
	if ( sigFunc != (GtkSignalFunc)NULL && !blockChangedEvent )
	{
		gtk_marshal_NONE__NONE( (GtkObject*)this, sigFunc, sigData,
										(GtkArg*)NULL );
	}
}


void VectorWidget::connect(GtkSignalFunc f, gpointer d)
{
	sigFunc = f;
	sigData = d;
}

void VectorWidget::disconnect()
{
	sigFunc = (GtkSignalFunc)0;
	sigData = NULL;
}


void VectorWidget::setValue(const Vector3& v)
{
	val = v;
	update();
}

Vector3 VectorWidget::getVector3() const
{
	return val;
}

Point3 VectorWidget::getPoint3() const
{
	return Point3(val);
}

GtkWidget* VectorWidget::getWidget()
{
	return box;
}

void VectorWidget::update()
{
	blockChangedEvent = true;
	ostrstream xstream, ystream, zstream;
	xstream << val.x << (char)0x0;
	ystream << val.y << (char)0x0;
	zstream << val.z << (char)0x0;
	gtk_entry_set_text( GTK_ENTRY(xentry), xstream.str() );
	gtk_entry_set_text( GTK_ENTRY(yentry), ystream.str() );
	gtk_entry_set_text( GTK_ENTRY(zentry), zstream.str() );
	blockChangedEvent = false;
}

void VectorWidget::x_changed(GtkWidget *widget, VectorWidget *klass)
{
	const gchar *xString = gtk_entry_get_text( GTK_ENTRY(widget ) );
	float value;
	sscanf( xString, "%f", &value );
	klass->val.x = value;
	klass->emitSignal();
}

void VectorWidget::y_changed(GtkWidget *widget, VectorWidget *klass)
{
	const gchar *yString = gtk_entry_get_text( GTK_ENTRY(widget ) );
	float value;
	sscanf( yString, "%f", &value );
	klass->val.y = value;
	klass->emitSignal();
}

void VectorWidget::z_changed(GtkWidget *widget, VectorWidget *klass)
{
	const gchar *zString = gtk_entry_get_text( GTK_ENTRY(widget ) );
	float value;
	sscanf( zString, "%f", &value );
	klass->val.z = value;
	klass->emitSignal();
}


#endif
