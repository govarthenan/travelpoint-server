PGDMP                      |            travelpoint    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16436    travelpoint    DATABASE     �   CREATE DATABASE travelpoint WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE travelpoint;
                postgres    false            �            1259    16438 	   user_info    TABLE     �  CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    phone_number bigint NOT NULL,
    location character varying(50) NOT NULL,
    password character varying NOT NULL,
    nic_passport character varying(50) DEFAULT 0 NOT NULL,
    email character varying(50) DEFAULT 0 NOT NULL
);
    DROP TABLE public.user_info;
       public         heap    postgres    false            �            1259    16437    user_info_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.user_info_user_id_seq;
       public          postgres    false    216            �           0    0    user_info_user_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;
          public          postgres    false    215                       2604    16441    user_info user_id    DEFAULT     v   ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);
 @   ALTER TABLE public.user_info ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    16438 	   user_info 
   TABLE DATA           z   COPY public.user_info (user_id, first_name, last_name, phone_number, location, password, nic_passport, email) FROM stdin;
    public          postgres    false    216   -       �           0    0    user_info_user_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.user_info_user_id_seq', 3, true);
          public          postgres    false    215                       2606    16445    user_info user_info_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);
 B   ALTER TABLE ONLY public.user_info DROP CONSTRAINT user_info_pkey;
       public            postgres    false    216            �   �   x����vC@ ��xkf��e������:�|��B���ӓh���#�C��@�(��{(��k��	�P$P��D�$E܏q��$�L�k�sb�l���vm��Ń�F�j�cZ�n�6�N��	!c��(�E_�v`P�R�2Ay<�?�n�.��~�e�&Y9�_S��!L�&q8c�'\vճZtOl���sSL略A�n���S���e������U�/�*w���o�׳�����A�ˌv(     