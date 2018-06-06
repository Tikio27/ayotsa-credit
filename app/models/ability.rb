# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    default_abilities
    admin_abilities if user.admin?
    analyst_abilities if user.analyst?
    director_abilities if user.director?
    asesor_abilities if user.asesor?
  end

  private

  def default_abilities
    can :manage, ActiveAdmin::Page, name: 'Dashboard'
    can :manage, Client
  end

  def admin_abilities
    can :manage, User
  end

  def analyst_abilities
  end

  def asesor_abilities

  end

  def director_abilities

  end

  def sales_abilities
    can :manage, Quota
    can :manage, Egress
    can :manage, Invoice
    can :manage, Tuition
    can :manage, ActiveAdmin::Page, name: 'Reporte de Ventas'
    can :manage, ActiveAdmin::Page, name: 'Reporte de Corte de Caja'
    can :manage, ActiveAdmin::Page, name: 'Reporte de Ingresos Detallado'
    can :manage, ActiveAdmin::Page, name: 'Cargo Guarderia'
    can :manage, ActiveAdmin::Page, name: 'Facturas'
    sales_helper
  end

  def sales_helper
    can :manage, Student
    can :manage, Order
    can :manage, Supplier
    can :manage, Product
    can :manage, Charge
  end

  def payment_abilities
    can :read, Order
    can :manage, Product
    can :manage, Charge
    can :manage, Invoice
    can :manage, Payer
    can :manage, Payment
    can :manage, Quota
    can :view, Family
  end

  def paydesk_abilities
    payment_abilities
    can :read, ActiveAdmin::Page, name: 'Facturas'
    can :read, ActiveAdmin::Page, name: 'Reporte de Adeudos'
    can :read, ActiveAdmin::Page, name: 'Reporte de Corte de Caja'
    can :read, ActiveAdmin::Page, name: 'Reporte de Ingresos Detallado'
  end

  def campus_abilities
    can :manage, Syllabus
    can :manage, Subject
    can :manage, Term
    can :manage, Campus
    can :manage, Grade
  end

  def student_abilities
    can :manage, Family
    can :manage, Relative
    can :manage, Student
  end

  def course_abilities
    can :manage, StudentGroup
    can :manage, Teacher
    can :manage, Course
    can :manage, Group
  end
end
